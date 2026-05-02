terraform {
  required_version = ">= 1.8.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.70"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30"
    }
  }
}

provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
    }
  }
}