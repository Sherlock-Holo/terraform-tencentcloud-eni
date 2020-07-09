provider "tencentcloud" {
  region = "ap-guangzhou"
}

resource "tencentcloud_security_group" "default1" {
  name = "tf-module-eni-sg1"
}

resource "tencentcloud_security_group" "default2" {
  name = "tf-module-eni-sg2"
}

resource "tencentcloud_vpc" "default" {
  cidr_block = "10.0.0.0/16"
  name       = "tf-module-vpc"
}

data "tencentcloud_availability_zones" "default" {}

resource "tencentcloud_subnet" "default" {
  availability_zone = data.tencentcloud_availability_zones.default.zones.0.name
  cidr_block        = "10.0.1.0/24"
  name              = "tf-module-subnet"
  vpc_id            = tencentcloud_vpc.default.id
}

data "tencentcloud_images" "default" {
  image_type = ["PUBLIC_IMAGE"]
  os_name    = "centos"
}

resource "tencentcloud_instance" "default" {
  availability_zone = data.tencentcloud_availability_zones.default.zones.0.name
  image_id          = data.tencentcloud_images.default.images.0.image_id
  system_disk_type  = "CLOUD_PREMIUM"
  vpc_id            = tencentcloud_vpc.default.id
  subnet_id         = tencentcloud_subnet.default.id
  instance_type     = "S2.MEDIUM2"
}

module "complex-eni" {
  source = "../../"

  region = "ap-guangzhou"

  ipv4s = [
    {
      ip      = "10.0.1.100"
      primary = true
    },
    {
      ip      = "10.0.1.120"
      primary = false
    },
    {
      ip      = "10.0.1.130"
      primary = false
    }
  ]

  vpc_id    = tencentcloud_vpc.default.id
  subnet_id = tencentcloud_subnet.default.id

  cvm_id = tencentcloud_instance.default.id

  availability_zone = tencentcloud_subnet.default.availability_zone

  security_groups = [tencentcloud_security_group.default1.id, tencentcloud_security_group.default2.id]

  attach_cvm = true
}