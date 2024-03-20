module "custom_resp_headers" {
  source = "../../modules/response-headers"

  name = "custom-response-headers"

  custom_headers = [
    {
      name  = "Cache-Control"
      value = "stale-while-revalidate=30,stale-if-error=86400"
    }
  ]

  server_timing_header = {
    enabled       = true
    sampling_rate = 100
  }
}

module "override_default" {
  source = "../../modules/response-headers"

  name = "override-default-response-headers"

  xss_protection_header = {
    enabled = false
  }
}
