resource "aws_cloudfront_cache_policy" "this" {
  name    = var.name
  comment = var.description

  default_ttl = var.default_ttl
  min_ttl     = var.min_ttl
  max_ttl     = var.max_ttl

  parameters_in_cache_key_and_forwarded_to_origin {
    enable_accept_encoding_brotli = contains(var.supported_compression_formats, "BROTLI")
    enable_accept_encoding_gzip   = contains(var.supported_compression_formats, "GZIP")

    cookies_config {
      cookie_behavior = var.cache_keys_in_cookies.behavior

      dynamic "cookies" {
        for_each = contains(["whitelist", "allExcept"], var.cache_keys_in_cookies.behavior) ? [var.cache_keys_in_cookies] : []

        content {
          items = cookies.value.items
        }
      }
    }
    headers_config {
      header_behavior = var.cache_keys_in_headers.behavior

      dynamic "headers" {
        for_each = contains(["whitelist"], var.cache_keys_in_headers.behavior) ? [var.cache_keys_in_headers] : []

        content {
          items = headers.value.items
        }
      }
    }
    query_strings_config {
      query_string_behavior = var.cache_keys_in_query_strings.behavior

      dynamic "query_strings" {
        for_each = contains(["whitelist", "allExcept"], var.cache_keys_in_query_strings.behavior) ? [var.cache_keys_in_query_strings] : []

        content {
          items = query_strings.value.items
        }
      }
    }
  }
}
