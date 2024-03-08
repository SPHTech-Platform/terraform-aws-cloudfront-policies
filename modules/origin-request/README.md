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
| [aws_cloudfront_origin_request_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_request_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | The description of the origin request policy. | `string` | `"Managed by Terraform."` | no |
| <a name="input_forwarding_cookies"></a> [forwarding\_cookies](#input\_forwarding\_cookies) | Determines whether any cookies in viewer requests are included in the origin request key and automatically included in requests that CloudFront sends to the origin.<br>    Valid values are `none`, `whitelist`, `all`, `allExcept`.<br>    `items` - A list of cookie names. | <pre>object({<br>    behavior = optional(string, "none")<br>    items    = optional(set(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_forwarding_headers"></a> [forwarding\_headers](#input\_forwarding\_headers) | Determines whether any HTTP headers are included in the origin request key and automatically included in requests that CloudFront sends to the origin.<br>    Valid values are `none`, `whitelist`, `allViewer`, `allViewerAndWhitelistCloudFront`, `allExcept`.<br>    `items` - A list of header names. | <pre>object({<br>    behavior = optional(string, "none")<br>    items    = optional(set(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_forwarding_query_strings"></a> [forwarding\_query\_strings](#input\_forwarding\_query\_strings) | Determines whether any URL query strings in viewer requests are included in the origin request key and automatically included in requests that CloudFront sends to the origin.<br>    Valid values are `none`, `whitelist`, `all`, `allExcept`.<br>    `items` - A list of query string names. | <pre>object({<br>    behavior = optional(string, "none")<br>    items    = optional(set(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | A unique name to identify the CloudFront Origin Request Policy. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
