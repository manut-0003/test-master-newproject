
variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "api_image" {
  description = "API container image"
  type        = string
}

variable "api_port" {
  description = "API port"
  type        = number
  default     = 8080
}

variable "api_desired_count" {
  description = "Number of ECS tasks"
  type        = number
  default     = 2
}

variable "redis_node_type" {
  description = "Redis node type"
  type        = string
  default     = "cache.t3.micro"
}

variable "domain_name" {
  description = "Optional domain name"
  type        = string
  default     = ""
}
