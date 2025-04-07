variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "redis_sg_id" {
  description = "Security group ID for Redis"
  type        = string
}

variable "redis_version" {
  description = "Redis engine version"
  type        = string
  default     = "5.0.6"
}