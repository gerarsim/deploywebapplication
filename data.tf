data "aws_availability_zones" "available" {
  state = "available"
}

data "terraform_remote_state" "eip" {
  backend = "s3"

  config = {
    bucket  = var.bucket
    key     = "${var.remote_state_path_environment_global}/eip/terraform.tfstate"
    region  = var.bucket_region
    profile = var.aws_profile
  }
}
