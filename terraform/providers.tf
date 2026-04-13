
terraform {
  required_version = ">= 1.5.0"

  # Uncomment for remote state
  # backend "s3" {
  #   bucket = "my-terraform-state-bucket"
  #   key    = "mindmeld/devops/terraform.tfstate"
  #   region = "us-east-1"
  # }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}
