<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.38 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.38 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_cache_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_cache_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cache_keys_in_cookies"></a> [cache\_keys\_in\_cookies](#input\_cache\_keys\_in\_cookies) | Whether any cookies in viewer requests are included in the cache key and automatically included in requests that CloudFront sends to the origin.<br>    Valid values for cookie\_behavior are `none`, `whitelist`, `allExcept`, and `all`. Defaults to `none`.<br>    `items` - A list of cookie names. | <pre>object({<br>    behavior = optional(string, "none")<br>    items    = optional(set(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_cache_keys_in_headers"></a> [cache\_keys\_in\_headers](#input\_cache\_keys\_in\_headers) | Whether any HTTP headers are included in the cache key and automatically included in requests that CloudFront sends to the origin.<br>    Valid values for header\_behavior are `none` and `whitelist`. Defaults to `none`.<br>    `items` - A list of header names. | <pre>object({<br>    behavior = optional(string, "none")<br>    items    = optional(set(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_cache_keys_in_query_strings"></a> [cache\_keys\_in\_query\_strings](#input\_cache\_keys\_in\_query\_strings) | Whether URL query strings in viewer requests are included in the cache key and automatically included in requests that CloudFront sends to the origin.<br>    Valid values for query\_string\_behavior are `none`, `whitelist`, `allExcept`, and `all`. Defaults to `none`.<br>    `items` - A list of query string names. | <pre>object({<br>    behavior = optional(string, "none")<br>    items    = optional(set(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_default_ttl"></a> [default\_ttl](#input\_default\_ttl) | Amount of time, in seconds, that objects are allowed to remain in the CloudFront cache before CloudFront sends a new request to the origin server to check if the object has been updated. Defaults to `86400` (one day). | `number` | `86400` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the cache policy. | `string` | `"Managed by Terraform."` | no |
| <a name="input_max_ttl"></a> [max\_ttl](#input\_max\_ttl) | Maximum amount of time, in seconds, that objects stay in the CloudFront cache before CloudFront sends another request to the origin to see if the object has been updated. Defaults to `31536000` (one year). | `number` | `31536000` | no |
| <a name="input_min_ttl"></a> [min\_ttl](#input\_min\_ttl) | Minimum amount of time, in seconds, that objects should remain in the CloudFront cache before a new request is sent to the origin to check for updates. Defaults to `1`. | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | A unique name to identify the CloudFront Cache Policy. | `string` | n/a | yes |
| <a name="input_supported_compression_formats"></a> [supported\_compression\_formats](#input\_supported\_compression\_formats) | A list of compression formats to enable, when the viewer supports it. Accept-Encoding HTTP header is included in the cache key and in requests sent to the origin by CloudFront. | `set(string)` | <pre>[<br>  "BROTLI",<br>  "GZIP"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_etag"></a> [etag](#output\_etag) | The current version of the cache policy. |
| <a name="output_id"></a> [id](#output\_id) | The identifier for the cache policy. |
<!-- END_TF_DOCS -->
