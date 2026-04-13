
output "frontend_url" {
  value = aws_cloudfront_distribution.frontend.domain_name
}

output "api_url" {
  value = aws_lb.api.dns_name
}

output "ecr_repository_url" {
  value = aws_ecr_repository.api.repository_url
}

output "s3_frontend_bucket" {
  value = aws_s3_bucket.frontend.bucket
}

output "redis_endpoint" {
  value     = aws_elasticache_replication_group.redis.primary_endpoint_address
  sensitive = true
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.frontend.id
}
