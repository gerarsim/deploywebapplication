provider "aws" {
  version = "~> 2.70"

  region  = var.aws_region
  profile = var.aws_profile
  ignore_tags {
    key_prefixes = ["kubernetes.io/cluster/", "kubernetes.io/role/"]
  }
}

provider "aws" {
  version = "~> 2.70"

  alias   = "transit"
  region  = var.aws_region
  profile = "as"
}
