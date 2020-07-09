module "simple-eni" {
  source = "../../"

  region = "ap-guangzhou"

  new_ipv4_count = 2

  vpc_name = "tf-module-vpc"
  vpc_cidr = "10.0.0.0/16"

  subnet_name = "tf-module-subnet"
  subnet_cidr = "10.0.20.0/28"

  tags = {
    "test" = "test"
  }
}