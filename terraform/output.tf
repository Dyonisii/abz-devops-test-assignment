output "ec2_public_ip" {
  description = "Public IP address of the WordPress instance"
  value       = module.ec2.public_ip   
}

output "rds_endpoint" {
  value = module.rds.db_host            
  sensitive = true
}

output "redis_endpoint" {
  value = module.redis.redis_host        
}
output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.vpc.public_subnet_id
}