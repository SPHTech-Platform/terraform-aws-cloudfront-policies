output "id" {
  description = "The identifier for the cache policy."
  value       = aws_cloudfront_cache_policy.this.id
}

output "etag" {
  description = "The current version of the cache policy."
  value       = aws_cloudfront_cache_policy.this.etag
}
