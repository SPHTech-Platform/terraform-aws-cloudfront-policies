output "id" {
  description = "The identifier for the response headers policy."
  value       = aws_cloudfront_response_headers_policy.this.id
}

output "etag" {
  description = "The current version of the response headers policy."
  value       = aws_cloudfront_response_headers_policy.this.etag
}
