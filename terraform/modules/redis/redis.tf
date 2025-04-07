resource "aws_elasticache_subnet_group" "main" {
  name       = "wordpress-redis-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "WordPress-Redis-Subnet-Group"
  }
  
}

resource "aws_elasticache_cluster" "main" {
  cluster_id           = "wordpress-redis"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis5.0"
  engine_version       = "5.0.6"
  port                 = 6379
  security_group_ids   = [var.redis_sg_id]
  subnet_group_name    = aws_elasticache_subnet_group.main.name

  tags = {
    Name = "WordPress-Redis"
  }

}