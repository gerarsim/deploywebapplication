provider "aws" {
  region  = "us-east-1"
  version = "~> 2.70"
}


terraform {
  backend "s3" {
    bucket = "samirbucketgoodone"
    key    = "global/eip/terraform.tfstate"
    region = "ca-central-1"
  }
}
resource "aws_s3_bucket" "samir_bucket" {
  bucket = "samirbucketgoodone"

  lifecycle {
    prevent_destroy = true
  }

  versioning {
    enabled = true

  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }


  }

}