locals {
  short_aws_region   = "${replace("${var.aws_region}", "/([[:alpha:]]{2})-([[:alpha:]]{1})([[:alpha:]]+?)-([[:digit:]]{1})/", "$1$2$4")}"
  availability_zones = data.aws_availability_zones.available.names
  // generate 16 subnets from vpc cidr block
  private_subnets_list = cidrsubnets(var.vpc_cidr, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)

  public_subnets = cidrsubnets(var.public_vpc_cidr[0], 2, 2, 2)
  //use first 15 private subnets from private_subnets_list
  private_subnets = slice(local.private_subnets_list, 0, 15)
  //use last private subnet from private_subnets_list
  service_subnets = cidrsubnets(local.private_subnets_list[15], 2, 2, 2)
}
