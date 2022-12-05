resource "aws_security_group" "ec2_security_group" {
  depends_on = [
    aws_vpc.vpc-production
  ]

  name        = var.security_group_name
  description = "Usage in Terraform laboratory"
  vpc_id      = aws_vpc.vpc-production.id

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

resource "aws_security_group" "rds_security_group" {
  depends_on = [
    aws_vpc.vpc-production
  ]

  name        = "Terraform-Estudos-Rapha-DB"
  description = "Allow RDS Access"
  vpc_id      = aws_vpc.vpc-production.id

  ingress {
    description = "MYSQL Database"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
