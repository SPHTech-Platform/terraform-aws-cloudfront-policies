resource "aws_cloudfront_response_headers_policy" "this" {
  name    = var.name
  comment = var.description

  dynamic "cors_config" {
    for_each = var.cors.enabled ? [var.cors] : []
    iterator = cors

    content {
      origin_override = cors.value.override

      access_control_allow_credentials = cors.value.access_control_allow_credentials

      access_control_allow_headers {
        items = cors.value.access_control_allow_headers
      }
      access_control_allow_methods {
        items = cors.value.access_control_allow_methods
      }
      access_control_allow_origins {
        items = cors.value.access_control_allow_origins
      }
      dynamic "access_control_expose_headers" {
        for_each = length(cors.value.access_control_expose_headers) > 0 ? [cors.value.access_control_expose_headers] : []

        content {
          items = access_control_expose_headers.value
        }
      }
      access_control_max_age_sec = cors.value.access_control_max_age
    }
  }

  dynamic "custom_headers_config" {
    for_each = length(var.custom_headers) > 0 ? [1] : []

    content {
      dynamic "items" {
        for_each = var.custom_headers

        content {
          header   = items.value.name
          value    = items.value.value
          override = items.value.override
        }
      }
    }
  }

  dynamic "remove_headers_config" {
    for_each = length(var.remove_headers) > 0 ? [1] : []

    content {
      dynamic "items" {
        for_each = var.remove_headers

        content {
          header = items.value
        }
      }
    }
  }

  dynamic "security_headers_config" {
    for_each = anytrue([
      var.content_security_policy_header.enabled,
      var.content_type_options_header.enabled,
      var.frame_options_header.enabled,
      var.referrer_policy_header.enabled,
      var.strict_transport_security_header.enabled,
      var.xss_protection_header.enabled,
    ]) ? [1] : []

    content {
      dynamic "content_security_policy" {
        for_each = var.content_security_policy_header.enabled ? [var.content_security_policy_header] : []
        iterator = header

        content {
          override                = header.value.override
          content_security_policy = header.value.value
        }
      }
      dynamic "content_type_options" {
        for_each = var.content_type_options_header.enabled ? [var.content_type_options_header] : []
        iterator = header

        content {
          override = header.value.override
        }
      }
      dynamic "frame_options" {
        for_each = var.frame_options_header.enabled ? [var.frame_options_header] : []
        iterator = header

        content {
          override     = header.value.override
          frame_option = header.value.value
        }
      }
      dynamic "referrer_policy" {
        for_each = var.referrer_policy_header.enabled ? [var.referrer_policy_header] : []
        iterator = header

        content {
          override        = header.value.override
          referrer_policy = header.value.value
        }
      }
      dynamic "strict_transport_security" {
        for_each = var.strict_transport_security_header.enabled ? [var.strict_transport_security_header] : []
        iterator = header

        content {
          override                   = header.value.override
          access_control_max_age_sec = header.value.max_age
          include_subdomains         = header.value.include_subdomains
          preload                    = header.value.preload
        }
      }
      dynamic "xss_protection" {
        for_each = var.xss_protection_header.enabled ? [var.xss_protection_header] : []
        iterator = header

        content {
          override   = header.value.override
          protection = header.value.filtering_enabled
          mode_block = header.value.block
          report_uri = header.value.report
        }
      }
    }
  }

  server_timing_headers_config {
    enabled       = var.server_timing_header.enabled
    sampling_rate = var.server_timing_header.sampling_rate
  }

  lifecycle {
    create_before_destroy = true
  }
}
