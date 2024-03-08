resource "aws_cloudfront_origin_request_policy" "this" {
  name    = var.name
  comment = var.description

  cookies_config {
    cookie_behavior = var.forwarding_cookies.behavior

    dynamic "cookies" {
      for_each = contains(["whitelist", "allExcept"], var.forwarding_cookies.behavior) ? [var.forwarding_cookies] : []

      content {
        items = cookies.value.items
      }
    }
  }
  headers_config {
    header_behavior = var.forwarding_headers.behavior

    dynamic "headers" {
      for_each = contains(["whitelist", "allExcept", "allViewerAndWhitelistCloudFront"], var.forwarding_headers.behavior) ? [var.forwarding_headers] : []

      content {
        items = headers.value.items
      }
    }
  }
  query_strings_config {
    query_string_behavior = var.forwarding_query_strings.behavior

    dynamic "query_strings" {
      for_each = contains(["whitelist", "allExcept"], var.forwarding_query_strings.behavior) ? [var.forwarding_query_strings] : []

      content {
        items = query_strings.value.items
      }
    }
  }
}
