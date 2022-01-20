module "vpc_label" {
  source      = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  namespace   = var.team_name
  environment = var.environment
  stage       = local.short_aws_region
  name        = "vpc"
  delimiter   = "-"

  label_order = ["environment", "stage", "namespace", "name"]

  tags = {
    "Environment" = var.environment
    "Team"        = var.team_name
    "Project"     = var.project
    "Version"     = var.modules_version
    "Component"   = var.component
    "Team_Domain" = var.domain
    "Region"      = var.aws_region
  }
}

module "single_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "= 2.74.0"

  name = module.vpc_label.id

  cidr                  = var.vpc_cidr
  secondary_cidr_blocks = var.public_vpc_cidr

  azs              = local.availability_zones
  private_subnets  = local.private_subnets
  public_subnets   = local.public_subnets
  database_subnets = local.service_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true

  database_subnet_suffix = "service"

  create_database_subnet_group = true

  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true

  reuse_nat_ips       = true                                                # <= Skip creation of EIPs for the NAT Gateways
  external_nat_ip_ids = data.terraform_remote_state.eip.outputs.nat_eip_ids # <= IPs specified here as input to the module

  database_subnet_group_tags = {
    "Name" = "${module.vpc_label.id}-service-subnet"
  }

  tags = merge(var.additional_tags, {
    "Environment" = var.environment
    "Team"        = var.team_name
    "Project"     = var.project
    "Version"     = var.modules_version
    "Component"   = var.component
    "Team_Domain" = var.domain
    "Region"      = var.aws_region
  })
}
