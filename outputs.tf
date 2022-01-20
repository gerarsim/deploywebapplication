output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.single_vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.single_vpc.vpc_cidr_block
}

output "private_subnets" {
  description = "The private subnets IDs of the VPC grouped by clusters"
  value       = zipmap(["cluster_subnets_1", "cluster_subnets_2", "cluster_subnets_3", "cluster_subnets_4", "cluster_subnets_5"], chunklist(module.single_vpc.private_subnets, 3))
}

output "private_subnets_cidr_blocks" {
  description = "The private subnets CIDR blocks of the VPC grouped by clusters"
  value       = zipmap(["cluster_subnets_cidr_blocks_1", "cluster_subnets_cidr_blocks_2", "cluster_subnets_cidr_blocks_3", "cluster_subnets_cidr_blocks_4", "cluster_subnets_cidr_blocks_5"], chunklist(module.single_vpc.private_subnets_cidr_blocks, 3))
}

output "service_subnets" {
  description = "The service subnets of the VPC grouped by clusters"
  value       = module.single_vpc.database_subnets
}

output "service_subnets_cidr_blocks" {
  description = "The service subnets CIDR blocks of the VPC grouped by clusters"
  value       = module.single_vpc.database_subnets_cidr_blocks
}

output "public_subnets" {
  description = "The public subnets of the VPC"
  value       = module.single_vpc.public_subnets
}

output "public_subnets_cidr_blocks" {
  description = "The public subnets CIDR blocks of the VPC"
  value       = module.single_vpc.public_subnets_cidr_blocks
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = module.single_vpc.default_security_group_id
}

output "default_network_acl_id" {
  description = "The ID of the default network ACL"
  value       = module.single_vpc.default_network_acl_id
}

output "internet_gateway_id" {
  description = "The ID of the Interbet Gateway"
  value       = module.single_vpc.igw_id
}

output "default_route_table_id" {
  description = "The ID of the default route table"
  value       = module.single_vpc.default_route_table_id
}

output "public_route_table_ids" {
  description = "The IDs of the public route tables"
  value       = module.single_vpc.public_route_table_ids
}

output "private_route_table_ids" {
  description = "The IDs of the private route tables"
  value       = module.single_vpc.private_route_table_ids
}

output "transit_gateway_attachment_id" {
  value = module.vpc_attachment.transit_gateway_attachment_id
