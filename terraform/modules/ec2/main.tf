resource "aws_instance" "main" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key-ssh
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.ec2_sg_id]

  user_data = templatefile("${path.module}/user_data.sh", {
    github_url   = var.github_url,
    github_token = var.github_token,
    # db_host      = var.db_host,
    # db_name      = var.db_name,
    # db_user      = var.db_user,
    # db_password  = var.db_password,
    # redis_host   = var.redis_host
  })
  tags = {
    Name = "WordPress-EC2"
  }
  lifecycle {
    # The instance will be reissued when null_resource changes
    replace_triggered_by = [null_resource.user_data_trigger.id]
  }

}

resource "null_resource" "user_data_trigger" {
  triggers = {
    # The hash of the file contents will change when it is changed
    user_data_hash = filesha1("${path.module}/user_data.sh")
    
    vars_hash = sha1(join("", [
      var.github_url,
      var.github_token,
      # var.db_host,
      # var.db_name,
      # var.db_user,
      # var.db_password,
      # var.redis_host
    ]))
  }
}