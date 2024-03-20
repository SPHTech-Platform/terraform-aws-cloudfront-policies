output "id" {
  description = "The identifier for the response headers policy."
  value       = aws_cloudfront_response_headers_policy.this.id
}

output "etag" {
  description = "The current version of the response headers policy."
  value       = aws_cloudfront_response_headers_policy.this.etag
}

output "security_headers" {
  description = "A configuration for several security-related HTTP response headers."
  value = {
    content_security_policy   = var.content_security_policy_header
    content_type_options      = var.content_type_options_header
    frame_options             = var.frame_options_header
    referrer_policy           = var.referrer_policy_header
    strict_transport_security = var.strict_transport_security_header
    xss_protection            = var.xss_protection_header
  }
}
