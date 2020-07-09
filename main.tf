provider "tencentcloud" {
  version = ">=1.28.0"
  region  = var.region != "" ? var.region : null
}

data "tencentcloud_availability_zones" "default" {
  count = (var.cvm_name != "" || var.subnet_name != "") ? 1 : 0
}

resource "tencentcloud_vpc" "default" {
  count = var.vpc_name != "" ? 1 : 0

  cidr_block = var.vpc_cidr
  name       = var.vpc_name

  tags = var.tags
}

resource "tencentcloud_subnet" "default" {
  count = var.subnet_name != "" ? 1 : 0

  availability_zone = data.tencentcloud_availability_zones.default[0].zones.0.name
  cidr_block        = var.subnet_cidr
  name              = "tf-module-subnet"
  vpc_id            = var.vpc_id != "" ? var.vpc_id : tencentcloud_vpc.default[0].id

  tags = var.tags
}

data "tencentcloud_images" "default" {
  count = var.cvm_name != "" ? 1 : 0

  image_type = ["PUBLIC_IMAGE"]
  os_name    = "centos"
}

data "tencentcloud_instance_types" "default" {
  count = var.cvm_name == "" ? 0 : 1

  availability_zone = var.availability_zone != "" ? var.availability_zone : data.tencentcloud_availability_zones.default[0].zones.0.name
  cpu_core_count    = 2
  memory_size       = 2
}

resource "tencentcloud_instance" "default" {
  count = var.cvm_name == "" ? 0 : 1

  instance_name     = var.cvm_name
  availability_zone = var.availability_zone != "" ? var.availability_zone : data.tencentcloud_availability_zones.default[0].zones.0.name
  instance_type     = data.tencentcloud_instance_types.default[0].instance_types.0.instance_type
  image_id          = data.tencentcloud_images.default[0].images.0.image_id
  system_disk_type  = "CLOUD_PREMIUM"
  vpc_id            = var.vpc_id != "" ? var.vpc_id : tencentcloud_vpc.default[0].id
  subnet_id         = var.subnet_id != "" ? var.subnet_id : tencentcloud_subnet.default[0].id
  project_id        = var.project_id
  tags              = var.tags
}

resource "tencentcloud_eni" "default" {
  count = var.eni_name != "" ? 1 : 0

  name            = var.eni_name
  description     = var.eni_description
  subnet_id       = var.subnet_id != "" ? var.subnet_id : tencentcloud_subnet.default[0].id
  vpc_id          = var.vpc_id != "" ? var.vpc_id : tencentcloud_vpc.default[0].id
  security_groups = var.security_groups
  tags            = var.tags


  ipv4_count = var.new_ipv4_count > 0 ? var.new_ipv4_count : null

  dynamic "ipv4s" {
    for_each = var.ipv4s
    content {
      ip          = lookup(ipv4s.value, "ip", "")
      primary     = lookup(ipv4s.value, "primary", null)
      description = lookup(ipv4s.value, "description", null)
    }
  }
}

resource "tencentcloud_eni_attachment" "default" {
  count = var.attach_cvm ? 1 : 0

  eni_id      = var.eni_id != "" ? var.eni_id : tencentcloud_eni.default[0].id
  instance_id = var.cvm_id != "" ? var.cvm_id : tencentcloud_instance.default[0].id
}
