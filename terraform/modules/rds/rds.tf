resource "aws_db_subnet_group" "main" {
  name       = "wordpress-rds-subnet-group"
  subnet_ids = var.private_subnet_ids
  tags = {
    Name = "WordPress-RDS-Subnet-Group"
  }
}

resource "aws_db_instance" "main" {
  identifier             = "wordpress-db"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0.40"
  instance_class         = "db.t3.micro"
  db_name                = var.db_name
  username               = var.db_user
  password               = var.db_password
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  publicly_accessible    = false
  vpc_security_group_ids = [var.rds_sg_id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  multi_az               = false

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "WordPress-DB"
  }
}