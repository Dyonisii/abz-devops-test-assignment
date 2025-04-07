output "redis_host" {
  value = aws_elasticache_cluster.main.cache_nodes[0].address
  sensitive   = false
}


