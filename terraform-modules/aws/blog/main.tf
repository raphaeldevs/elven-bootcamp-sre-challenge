terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.1.7"
}

provider "aws" {
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  region     = var.region
}

resource "aws_security_group" "SecurityGroup" {
  name        = var.security_group_name
  description = "Usage in Terraform laboratory"
  vpc_id      = var.security_group_vpc_id

  ingress {
    description = "IP do Rapha"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["177.47.36.145/32"]
  }

  ingress {
    description = "Acesso liberado para internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = var.ec2_name

  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  key_name                    = var.ec2_key_name
  monitoring                  = false
  vpc_security_group_ids      = [aws_security_group.SecurityGroup.id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  count                       = var.ec2_count

  user_data = <<-EOF
    #!/usr/bin/env bash
    export AWS_ACCESS_KEY_ID="${var.aws_access_key_id}"
    export AWS_SECRET_ACCESS_KEY="${var.aws_secret_access_key}"

    curl https://raw.githubusercontent.com/raphaeldevs/elven-bootcamp-sre-challenge/main/setup-ansible.sh -sSf | sh
  EOF
}

# module "rds" {
#   source  = "terraform-aws-modules/rds/aws"
#   version = "5.1.1"

#   identifier = var.rds_identifier

#   engine            = var.rds_engine
#   engine_version    = var.rds_engine_version
#   instance_class    = var.rds_instance_class
#   allocated_storage = 20

#   db_name     = "blog"
#   db_username = "wp_user"
#   port        = "3306"
# }
