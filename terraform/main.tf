# VPC module - creates network infrastructure
module "vpc" {
  source = "./modules/vpc"
  db_password = var.db_password  # DB password for internal use
  vpc_cidr = var.vpc_cidr        # Main VPC CIDR (e.g. "10.0.0.0/16")
  public_subnet_cidr = var.public_subnet_cidr  # Public subnet CIDR
  private_subnet_1_cidr = "10.0.2.0/24"       # Private subnet 1 (AZ1)
  private_subnet_2_cidr = "10.0.3.0/24"       # Private subnet 2 (AZ2)
}

# Security Groups module - defines firewall rules
module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id      
  ec2_sg_id = module.security_groups.ec2_sg_id  
}

# RDS module - creates managed MySQL database
module "rds" {
  source = "./modules/rds"
  db_user = var.db_user           # Database admin username
  db_name = var.db_name           # Initial database name
  db_password = var.db_password   # Database admin password
  private_subnet_ids = [          # Subnets for RDS placement
    module.vpc.private_subnet_1_id,
    module.vpc.private_subnet_2_id
  ]
  rds_sg_id = module.security_groups.rds_sg_id  # Security Group for RDS
}

# Redis module - creates caching service
module "redis" {
  source = "./modules/redis"
  private_subnet_ids = [module.vpc.public_subnet_id]  
  redis_sg_id = module.security_groups.redis_sg_id    
}

# EC2 module - deploys WordPress instance
module "ec2" {
  source = "./modules/ec2"
  ami_id = var.ami_id             
  public_subnet_id = module.vpc.public_subnet_id  # Public subnet placement
  ec2_sg_id = module.security_groups.ec2_sg_id    # Security Group for EC2
  key-ssh = var.key-ssh           # SSH key name for access
  github_url = var.github_url     # GitHub repo URL
  github_token = var.github_token # GitHub access token
  
  # db_host = module.rds.db_host
  # db_name = module.rds.db_name
  # db_user = module.rds.db_user
  # db_password = var.db_password
  # redis_host = module.redis.redis_host
}