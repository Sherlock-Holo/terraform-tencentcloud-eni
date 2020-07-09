output "project_id" {
  description = "The project id."
  value       = var.project_id
}

output "tags" {
  description = "The list of tags."
  value       = var.tags
}

output "eni_id" {
  description = "The list of ENI id."
  value       = compact(concat(tencentcloud_eni.default.*.id, [var.eni_id]))
}

output "vpc_id" {
  description = "The list of VPC id."
  value       = compact(concat(tencentcloud_vpc.default.*.id, [var.vpc_id]))
}

output "vpc_name" {
  description = "The list of VPC name."
  value       = distinct([var.vpc_name])
}

output "vpc_cidr" {
  description = "The list of VPC cidr block."
  value       = distinct([var.vpc_cidr])
}

output "subnet_id" {
  description = "The list of subnet id."
  value       = compact(concat(tencentcloud_subnet.default.*.id, [var.vpc_id]))
}

output "subnet_name" {
  description = "The list of subnet name."
  value       = distinct([var.subnet_name])
}

output "subnet_cidr" {
  description = "The list of subnet cidr block."
  value       = distinct([var.subnet_cidr])
}

output "cvm_id" {
  description = "The list of CVM id."
  value       = compact(concat(tencentcloud_instance.default.*.id, [var.cvm_id]))
}

output "cvm_name" {
  description = "The list of CVM name."
  value       = distinct([var.cvm_name])
}

output "eni_attachment_id" {
  description = "The list of ENI attachment id."
  value       = compact(tencentcloud_eni_attachment.default.*.id)
}

output "security_groups" {
  description = "The list of security group id."
  value       = distinct(var.security_groups)
}
