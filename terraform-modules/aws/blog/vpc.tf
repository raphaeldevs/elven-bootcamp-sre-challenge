resource "aws_vpc" "vpc-production" {
  cidr_block           = var.vpc_cidr_base
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"

  tags = {
    "Name" = var.vpc_name
  }
}
