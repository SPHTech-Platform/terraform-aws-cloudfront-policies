variable "name" {
  description = "A unique name to identify the CloudFront Origin Request Policy."
  type        = string
}

variable "description" {
  description = "The description of the origin request policy."
  type        = string
  default     = "Managed by Terraform."
}

variable "forwarding_cookies" {
  description = <<EOF
    Determines whether any cookies in viewer requests are included in the origin request key and automatically included in requests that CloudFront sends to the origin.
    Valid values are `none`, `whitelist`, `all`, `allExcept`.
    `items` - A list of cookie names.
  EOF
  type = object({
    behavior = optional(string, "none")
    items    = optional(set(string), [])
  })
  default = {}

  validation {
    condition     = contains(["none", "whitelist", "all", "allExcept"], var.forwarding_cookies.behavior)
    error_message = "Valid values for `behavior` are `none`, `whitelist`, `all`, and `allExcept`."
  }
}

variable "forwarding_headers" {
  description = <<EOF
    Determines whether any HTTP headers are included in the origin request key and automatically included in requests that CloudFront sends to the origin.
    Valid values are `none`, `whitelist`, `allViewer`, `allViewerAndWhitelistCloudFront`, `allExcept`.
    `items` - A list of header names.
  EOF
  type = object({
    behavior = optional(string, "none")
    items    = optional(set(string), [])
  })
  default = {}

  validation {
    condition     = contains(["none", "whitelist", "allViewer", "allViewerAndWhitelistCloudFront", "allExcept"], var.forwarding_headers.behavior)
    error_message = "Valid values for `none`, `whitelist`, `allViewer`, `allViewerAndWhitelistCloudFront` and `allExcept`."
  }
}

variable "forwarding_query_strings" {
  description = <<EOF
    Determines whether any URL query strings in viewer requests are included in the origin request key and automatically included in requests that CloudFront sends to the origin.
    Valid values are `none`, `whitelist`, `all`, `allExcept`.
    `items` - A list of query string names.
  EOF
  type = object({
    behavior = optional(string, "none")
    items    = optional(set(string), [])
  })
  default = {}

  validation {
    condition     = contains(["none", "whitelist", "all", "allExcept"], var.forwarding_query_strings.behavior)
    error_message = "Valid values for `behavior` are `none`, `whitelist`, `all` and `allExcept`."
  }
}
