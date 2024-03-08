variable "name" {
  description = "A unique name to identify the CloudFront Cache Policy."
  type        = string
}

variable "description" {
  description = "The description of the cache policy."
  type        = string
  default     = "Managed by Terraform."
}

variable "default_ttl" {
  description = "Amount of time, in seconds, that objects are allowed to remain in the CloudFront cache before CloudFront sends a new request to the origin server to check if the object has been updated. Defaults to `86400` (one day)."
  type        = number
  default     = 86400
}

variable "min_ttl" {
  description = "Minimum amount of time, in seconds, that objects should remain in the CloudFront cache before a new request is sent to the origin to check for updates. Defaults to `1`."
  type        = number
  default     = 1
}

variable "max_ttl" {
  description = "Maximum amount of time, in seconds, that objects stay in the CloudFront cache before CloudFront sends another request to the origin to see if the object has been updated. Defaults to `31536000` (one year)."
  type        = number
  default     = 31536000
}

variable "supported_compression_formats" {
  description = "A list of compression formats to enable, when the viewer supports it. Accept-Encoding HTTP header is included in the cache key and in requests sent to the origin by CloudFront."
  type        = set(string)
  default     = ["BROTLI", "GZIP"]

  validation {
    condition = alltrue([
      for format in var.supported_compression_formats :
      contains(["BROTLI", "GZIP"], format)
    ])
    error_message = "Valid values are `BROTLI` and `GZIP`."
  }
}

variable "cache_keys_in_cookies" {
  description = <<EOF
    Whether any cookies in viewer requests are included in the cache key and automatically included in requests that CloudFront sends to the origin.
    Valid values for cookie_behavior are `none`, `whitelist`, `allExcept`, and `all`. Defaults to `none`.
    `items` - A list of cookie names.
  EOF
  type = object({
    behavior = optional(string, "none")
    items    = optional(set(string), [])
  })
  default = {}

  validation {
    condition     = contains(["none", "whitelist", "allExcept", "all"], var.cache_keys_in_cookies.behavior)
    error_message = "Valid values for `behavior` are `none`, `whitelist`, `allExcept` and `all`."
  }
}

variable "cache_keys_in_headers" {
  description = <<EOF
    Whether any HTTP headers are included in the cache key and automatically included in requests that CloudFront sends to the origin.
    Valid values for header_behavior are `none` and `whitelist`. Defaults to `none`.
    `items` - A list of header names.
  EOF
  type = object({
    behavior = optional(string, "none")
    items    = optional(set(string), [])
  })
  default = {}

  validation {
    condition     = contains(["none", "whitelist"], var.cache_keys_in_headers.behavior)
    error_message = "Valid values for `behavior` are `none` and `whitelist`."
  }
}

variable "cache_keys_in_query_strings" {
  description = <<EOF
    Whether URL query strings in viewer requests are included in the cache key and automatically included in requests that CloudFront sends to the origin.
    Valid values for query_string_behavior are `none`, `whitelist`, `allExcept`, and `all`. Defaults to `none`.
    `items` - A list of query string names.
  EOF
  type = object({
    behavior = optional(string, "none")
    items    = optional(set(string), [])
  })
  default = {}

  validation {
    condition     = contains(["none", "whitelist", "allExcept", "all"], var.cache_keys_in_query_strings.behavior)
    error_message = "Valid values for `behavior` are `none`, `whitelist`, `allExcept`, and `all`."
  }
}
