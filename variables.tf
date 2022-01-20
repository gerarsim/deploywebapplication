variable "additional_tags" {
  default     = {}
  type        = map(string)
  description = "Adds additional tags to your resources"
}

variable "component" {
  type        = string
  description = "The component Name"
  default     = "vpc"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR of the new VPC"
  default     = "172.23.32.0/19"
}

variable "public_vpc_cidr" {
  type        = list(string)
  description = "The CIDR of the public VPC part"
  default     = ["172.23.72.0/25"]
}

variable "remote_state_path_environment_global" {
  type        = string
  description = "path of the environment _global remote state"
  default     = ""
}

variable "enable_transit" {
  default     = false
  type        = bool
  description = "true or false to enable the transit functionality"
}

variable "transit_gateway_id" {
  type        = map
  description = "The Transit Gateway ID per AWS region to attach"
  default = {
    "eu-central-1" = "tgw-1234567"
    "eu-west-1"    = ""
  }
}

variable "transit_gateway_resource_share_arn" {
  type        = map
  description = "(Required) ARN of the Transit Gateway resource share in the Management account"
  default = {
    "eu-central-1" = "arn:aws:ram:eu-central-1:123456:resource-share/2334444-c520-21a8-c00d-3db0350791e6"
    "eu-west-1"    = ""
  }
}
