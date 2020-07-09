output "project_id" {
  description = "The project id."
  value       = module.simple-eni.project_id
}

output "tags" {
  description = "The list of tags."
  value       = module.simple-eni.tags
}

output "eni_id" {
  description = "The list of ENI id."
  value       = module.simple-eni.eni_id
}

output "vpc_id" {
  description = "The list of VPC id."
  value       = module.simple-eni.vpc_id
}

output "vpc_name" {
  description = "The list of VPC name."
  value       = module.simple-eni.vpc_name
}

output "vpc_cidr" {
  description = "The list of VPC id."
  value       = module.simple-eni.vpc_cidr
}

output "subnet_id" {
  description = "The list of subnet id."
  value       = module.simple-eni.subnet_id
}

output "subnet_name" {
  description = "The list of subnet name."
  value       = module.simple-eni.subnet_name
}

output "subnet_cidr" {
  description = "The list of VPC id."
  value       = module.simple-eni.subnet_cidr
}
