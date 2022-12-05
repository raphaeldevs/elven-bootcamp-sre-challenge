module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"

  depends_on = [
    aws_security_group.rds_security_group,
    aws_subnet.private_subnet
  ]

  identifier = var.rds_instance_id

  engine                = var.rds_engine
  engine_version        = var.rds_engine_version
  instance_class        = var.rds_instance_class
  allocated_storage     = 20 # 20 GB
  publicly_accessible   = false
  max_allocated_storage = 0 # 0 to disable autoscaling

  vpc_security_group_ids = [aws_security_group.rds_security_group.id]

  username = var.rds_admin_user
  port     = var.rds_port
  password = var.rds_admin_password

  subnet_ids = [element(aws_subnet.private_subnet, 0).id]
}

provider "mysql" {
  endpoint = module.rds.db_instance_endpoint
  username = var.rds_blog_username
  password = var.rds_blog_db_password
}

resource "mysql_user" "blog_user" {
  depends_on = [
    module.rds
  ]

  user               = var.rds_blog_username
  host               = module.rds.db_instance_endpoint
  plaintext_password = var.rds_admin_password
}

resource "mysql_grant" "blog_user_grant" {
  depends_on = [
    module.rds
  ]

  user       = var.rds_blog_username
  host       = module.rds.db_instance_endpoint
  database   = var.rds_blog_db_name
  privileges = ["*"]
}

resource "mysql_database" "database" {
  depends_on = [
    module.rds
  ]

  name = var.rds_blog_db_name
}

