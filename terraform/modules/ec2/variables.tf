variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "ec2_sg_id" {
  description = "Security group ID for EC2"
  type        = string
}

# variable "db_host" {
#   description = "RDS endpoint"
#   type        = string
# }

# variable "db_name" {
#   description = "Database name"
#   type        = string
# }

# variable "db_user" {
#   description = "Database username"
#   type        = string
# }

# variable "db_password" {
#   description = "Database password"
#   type        = string
#   sensitive   = true
# }

# variable "redis_host" {
#   description = "Redis endpoint"
#   type        = string
# }

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "github_url" {
  description = "github_url"
  type        = string
}

variable "github_token" {
  description = "github_token"
  type        = string
}

variable "key-ssh" {
  description = "key-ssh"
  type        = string
}
