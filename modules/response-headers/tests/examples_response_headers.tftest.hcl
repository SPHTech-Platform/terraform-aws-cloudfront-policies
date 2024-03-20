mock_provider "aws" {
}

run "validate" {
  command = apply

  module {
    source = "../../examples/response-headers"
  }
}

run "validate_security_defaults" {
  command = apply

  module {
    source = "../../examples/response-headers"
  }

  assert {
    condition = module.custom_resp_headers.security_headers.strict_transport_security.enabled == true
    error_message = "HSTS should be enabled"
  }

  assert {
    condition = (module.custom_resp_headers.security_headers.frame_options.enabled == true) && (module.custom_resp_headers.security_headers.frame_options.value == "DENY")
    error_message = "Frame options should be enabled and deny"
  }

  assert {
    condition = module.custom_resp_headers.security_headers.content_type_options.enabled == true
    error_message = "Content type options should be enabled"
  }

  assert {
    condition = (module.custom_resp_headers.security_headers.xss_protection.enabled == true) && (module.custom_resp_headers.security_headers.xss_protection.block == true)
    error_message = "XSS protection should be enabled"
  }

  assert {
    condition = (module.custom_resp_headers.security_headers.referrer_policy.enabled == true) && (module.custom_resp_headers.security_headers.referrer_policy.value == "same-origin")
    error_message = "Referrer policy should be enabled with `same-origin`"
  }
}

run "override_defaults" {
  command = apply

  module {
    source = "../../examples/response-headers"
  }

  assert {
    condition = module.override_default.security_headers.xss_protection.enabled == false
    error_message = "XSS protection can be disabled"
  }
}
