output "project_id" {
  description = "The project id."
  value       = module.complex-eni.project_id
}

output "tags" {
  description = "The list of tags."
  value       = module.complex-eni.tags
}

output "eni_id" {
  description = "The list of ENI id."
  value       = module.complex-eni.eni_id
}

output "vpc_id" {
  description = "The list of VPC id."
  value       = module.complex-eni.vpc_id
}

output "subnet_id" {
  description = "The list of subnet id."
  value       = module.complex-eni.subnet_id
}

output "cvm_id" {
  description = "The list of CVM id."
  value       = module.complex-eni.cvm_id
}

output "eni_attachment_id" {
  description = "The list of ENI attachment id."
  value       = module.complex-eni.eni_attachment_id
}

output "security_groups" {
  description = "The list of security group id."
  value       = module.complex-eni.security_groups
}
