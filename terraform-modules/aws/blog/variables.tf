variable "aws_access_key_id" {
  default = ""
}

variable "aws_secret_access_key" {
  default = ""
}

variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr_base" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "VPC-Estudos-Rapha-II"
}

variable "public_subnets" {
  type = list(any)
  default = [
    {
      name : "Pub-AZ-A-II"
      cidr : "10.0.0.0/24"
      availability_zone : "us-east-1a"
    },
    {
      name : "Pub-AZ-B-II"
      cidr : "10.0.1.0/24"
      availability_zone : "us-east-1b"
    }
  ]
}

variable "private_subnets" {
  type = list(any)
  default = [
    {
      name : "Priv-AZ-A-II"
      cidr : "10.0.2.0/24",
      availability_zone : "us-east-1a"
    },
    {
      name : "priv-AZ-B-II"
      cidr : "10.0.3.0/24",
      availability_zone : "us-east-1b"
    }
  ]
}

variable "security_group_name" {
  default = "Terraform-Estudos-Rapha-SG"
}

variable "ec2_ami" {
  default = "ami-0149b2da6ceec4bb0"
}

variable "ec2_type" {
  default = "t2.micro"
}

variable "ec2_name" {
  default = "Terraform-Estudos-Rapha"
}

variable "ec2_key_name" {
  default = ""
}

variable "ec2_count" {
  default = 1
}

variable "rds_instance_id" {
  default = ""
}

variable "rds_admin_user" {
  default = ""
}

variable "rds_admin_password" {
  default = ""
}

variable "rds_engine" {
  default = "mysql"
}

variable "rds_port" {
  default = "3306"
}

variable "rds_blog_db_name" {
  default = ""
}

variable "rds_blog_db_password" {
  default = ""
}

variable "rds_blog_username" {
  default = ""
}

variable "rds_engine_version" {
  default = "5.7.25"
}

variable "rds_instance_class" {
  default = "db.t2.micro"
}
