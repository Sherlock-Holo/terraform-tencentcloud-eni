output "project_id" {
  description = "The project id."
  value       = module.eni-attach-cvm.project_id
}

output "tags" {
  description = "The list of tags."
  value       = module.eni-attach-cvm.tags
}

output "eni_id" {
  description = "The list of ENI id."
  value       = module.eni-attach-cvm.eni_id
}

output "vpc_id" {
  description = "The list of VPC id."
  value       = module.eni-attach-cvm.vpc_id
}

output "vpc_name" {
  description = "The list of VPC name."
  value       = module.eni-attach-cvm.vpc_name
}

output "vpc_cidr" {
  description = "The list of VPC id."
  value       = module.eni-attach-cvm.vpc_cidr
}

output "subnet_id" {
  description = "The list of subnet id."
  value       = module.eni-attach-cvm.subnet_id
}

output "subnet_name" {
  description = "The list of subnet name."
  value       = module.eni-attach-cvm.subnet_name
}

output "subnet_cidr" {
  description = "The list of VPC id."
  value       = module.eni-attach-cvm.subnet_cidr
}

output "cvm_id" {
  description = "The list of CVM id."
  value       = module.eni-attach-cvm.cvm_id
}

output "cvm_name" {
  description = "The list of CVM name."
  value       = module.eni-attach-cvm.cvm_name
}

output "eni_attachment_id" {
  description = "The list of ENI attachment id."
  value       = module.eni-attach-cvm.eni_attachment_id
}
