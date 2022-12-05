module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  depends_on = [
    aws_subnet.public_subnet
  ]

  name = var.ec2_name

  count                       = var.ec2_count
  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  key_name                    = var.ec2_key_name
  monitoring                  = false
  vpc_security_group_ids      = [aws_security_group.ec2_security_group.id]
  subnet_id                   = element(aws_subnet.public_subnet, count.index).id
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/usr/bin/env bash
    # curl https://raw.githubusercontent.com/raphaeldevs/elven-bootcamp-sre-challenge/main/setup-ansible.sh -sSf | sh
  EOF
}
