variable "region" {
  description = "TencentCloud region to launch resources."
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "project_id" {
  description = "The project id to launch all resources."
  default     = 0
}

variable "vpc_id" {
  description = "Specify the VPC id to launch resources."
  default     = ""
}

variable "vpc_name" {
  description = "Specify the VPC name when `vpc_id` is not specified."
  default     = ""
}

variable "vpc_cidr" {
  description = "Specify the cidr block when `vpc_id` is not specified."
  default     = ""
}

variable "subnet_id" {
  description = "Specify the subnet id to launch resources."
  default     = ""
}

variable "subnet_name" {
  description = "Specify the subnet name when `vpc_id` is not specified."
  default     = ""
}

variable "subnet_cidr" {
  description = "Specify the cidr block when `vpc_id` is not specified."
  default     = ""
}

variable "eni_id" {
  description = "Specify the ENI id to launch resources."
  default     = ""
}

variable "eni_name" {
  description = "Specify the ENI name when `eni_id` is not specified."
  default     = "tf-module-eni"
}

variable "eni_description" {
  description = "Specify the ENI description when `eni_id` is not specified."
  default     = ""
}

variable "new_ipv4_count" {
  description = "Specify how many ipv4 will be allocated when `eni_id` is not specified."
  default     = 0
}

variable "ipv4s" {
  description = "Specify the custom ipv4 configs, each element must contain `ip(string)` and `primary(bool)`, the `description(string)` is optional, when `eni_id` is not specified."
  type        = list(map(string))
  default     = []
}

variable "security_groups" {
  description = "Specify the security group id set which will bind on the ENI when `eni_id` is not specified."
  type        = list(string)
  default     = []
}

variable "cvm_id" {
  description = "Specify the CVM id to bind with the ENI."
  default     = ""
}

variable "cvm_name" {
  description = "Specify the CVM name to create a CVM when `cvm_id` is not specified."
  default     = ""
}

variable "attach_cvm" {
  description = "Specify if attach the CVM to the ENI."
  default     = false
}

variable "availability_zone" {
  description = "Specify the CVM availability zone when `cvm_id` is not specified, if not specify, will choose an availability zone automatically."
  default     = ""
}
