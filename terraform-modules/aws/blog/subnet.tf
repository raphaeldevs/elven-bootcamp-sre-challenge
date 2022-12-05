resource "aws_subnet" "public_subnet" {
  depends_on = [
    aws_vpc.vpc-production
  ]

  vpc_id                  = aws_vpc.vpc-production.id
  count                   = length(var.public_subnets)
  cidr_block              = element(var.public_subnets, count.index).cidr
  availability_zone       = element(var.public_subnets, count.index).availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = element(var.public_subnets, count.index).name
  }
}

resource "aws_subnet" "private_subnet" {
  depends_on = [
    aws_vpc.vpc-production
  ]

  vpc_id                  = aws_vpc.vpc-production.id
  count                   = length(var.private_subnets)
  cidr_block              = element(var.private_subnets, count.index).cidr
  availability_zone       = element(var.private_subnets, count.index).availability_zone
  map_public_ip_on_launch = false
  tags = {
    Name = element(var.private_subnets, count.index).name
  }
}
