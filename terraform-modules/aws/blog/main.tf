terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    mysql = {
      source = "kaplanmaxe/mysql"
      version = "1.9.5"
    }
  }

  required_version = ">= 1.1.7"
}

provider "aws" {
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  region     = var.aws_region
}
