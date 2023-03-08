terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest
provider "aws" {
  region = var.region
}
