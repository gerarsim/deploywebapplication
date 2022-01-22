provider "aws" {
  region  = "us-east-1"
  version = "~> 2.70"
}


terraform {
  backend "s3" {
    bucket = "samirbucketgoodone"
    key    = "global/eip/terraform.tfstate"
    region = "us-central-1"
  }
}