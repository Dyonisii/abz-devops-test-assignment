output "db_host" {
  value = aws_db_instance.main.address
  sensitive   = false
}

output "db_name" {
  value = aws_db_instance.main.db_name
}

output "db_username" {
  value = aws_db_instance.main.username
}