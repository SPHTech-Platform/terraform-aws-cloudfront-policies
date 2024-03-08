module "custom_resp_headers" {
  source = "../../modules/response-headers"

  name = "custom-response-headers"
  strict_transport_security_header = {
    enabled  = true
    override = true

    max_age            = 31536000
    include_subdomains = true
    preload            = true
  }

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
