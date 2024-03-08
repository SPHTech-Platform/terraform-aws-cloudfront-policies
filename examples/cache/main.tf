module "cache_key_whitelist" {
  source = "../../modules/cache"

  name        = "cache-key-whitelist"
  min_ttl     = 1
  default_ttl = 180
  max_ttl     = 31536000

  cache_keys_in_headers = {
    behavior = "whitelist"
    items    = ["X-Auth-Request-Groups"]
  }
  cache_keys_in_query_strings = {
    behavior = "whitelist"
    items    = ["page", "test"]
  }
}
