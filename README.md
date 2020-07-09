
# TencentCloud ENI Module for Terraform

## terraform-tencentcloud-eni

A terraform module used to create TencentCloud ENI.

The following resources are included.

* [ENI](https://www.terraform.io/docs/providers/tencentcloud/r/eni.html)
* [ENI attachment](https://www.terraform.io/docs/providers/tencentcloud/r/eni_attachment.html)
* [VPC](https://www.terraform.io/docs/providers/tencentcloud/r/vpc.html)
* [VPC Subnet](https://www.terraform.io/docs/providers/tencentcloud/r/subnet.html)
* [CVM](https://www.terraform.io/docs/providers/tencentcloud/r/instance.html)
* [Security Group](https://www.terraform.io/docs/providers/tencentcloud/r/security_group.html)

## Usage

```hcl
module "simple-eni" {
  source = "terraform-tencentcloud-modules/eni/tencentcloud"

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
```

## Conditional Creation

This module can create ENI and ENI attachment.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| eni_id | Specify the ENI id to launch resources. | string |  | no 
| eni_name | Specify the ENI name when `eni_id` is not specified. | string | tf-module-eni | no 
| ipv4s | Specify the custom ipv4 configs, each element must contain `ip(string)` and `primary(bool)`, the `description(string)` is optional, when `eni_id` is not specified. | list(map(string)) | [] | no 
| security_groups | Specify the security group id set which will bind on the ENI when `eni_id` is not specified. | list(string) | [] | no 
| region | TencentCloud region to launch resources. | string |  | no 
| tags | A map of tags to add to all resources. | map(string) | {} | no 
| project_id | The project id to launch all resources. | string | 0 | no 
| subnet_cidr | Specify the cidr block when `vpc_id` is not specified. | string |  | no 
| cvm_name | Specify the CVM name to create a CVM when `cvm_id` is not specified. | string |  | no 
| vpc_cidr | Specify the cidr block when `vpc_id` is not specified. | string |  | no 
| availability_zone | Specify the CVM availability zone when `cvm_id` is not specified, if not specify, will choose an availability zone automatically. | string |  | no 
| vpc_name | Specify the VPC name when `vpc_id` is not specified. | string |  | no 
| subnet_name | Specify the subnet name when `vpc_id` is not specified. | string |  | no 
| eni_description | Specify the ENI description when `eni_id` is not specified. | string |  | no 
| cvm_id | Specify the CVM id to bind with the ENI. | string |  | no 
| vpc_id | Specify the VPC id to launch resources. | string |  | no 
| subnet_id | Specify the subnet id to launch resources. | string |  | no 
| new_ipv4_count | Specify how many ipv4 will be allocated when `eni_id` is not specified. | string | 0 | no 
| attach_cvm | Specify if attach the CVM to the ENI. | string | false | no 


## Outputs

| Name | Description |
|------|-------------|
| vpc_name | The list of VPC name. |
| vpc_cidr | The list of VPC cidr block. |
| subnet_id | The list of subnet id. |
| subnet_name | The list of subnet name. |
| cvm_name | The list of CVM name. |
| tags | The list of tags. |
| eni_id | The list of ENI id. |
| vpc_id | The list of VPC id. |
| eni_attachment_id | The list of ENI attachment id. |
| security_groups | The list of security group id. |
| project_id | The project id. |
| subnet_cidr | The list of subnet cidr block. |
| cvm_id | The list of CVM id. |


## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.
