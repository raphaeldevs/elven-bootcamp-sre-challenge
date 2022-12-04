variable "aws_access_key_id" {
  default = ""
}

variable "aws_secret_access_key" {
  default = ""
}

variable "profile" {
  default = ""
}

variable "region" {
  default = "us-east-1"
}

variable "security_group_name" {
  default = "Terraform-Estudos-Rapha-SG"
}

variable "security_group_vpc_id" {
  default = "vpc-07b7739ac83a7ffa1"
}

variable "subnet_id" {
  default = "subnet-08b0477bc100625a7"
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
  default = "SSH-Estudos-Rapha-Virginia"
}

variable "ec2_count" {
  default = 1
}

variable "rds_identifier" {
  default = "blog"
}

variable "rds_admin_name" {
  default = "admin"
}

variable "rds_engine" {
  default = "mysql"
}

variable "rds_blog_db_name" {
  default = "blog"
}

variable "rds_engine_version" {
  default = "5.7.25"
}

variable "rds_instance_class" {
  default = "db.t2.micro"
}
