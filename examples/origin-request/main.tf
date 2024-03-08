module "forward_headers" {
  source = "../../modules/origin-request"

  name = "forward-headers"
  forwarding_headers = {
    behavior = "whitelist"
    items    = ["host", "x-api-key"]
  }
}
