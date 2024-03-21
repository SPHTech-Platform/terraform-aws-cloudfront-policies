# AWS Cloudfront Policies

Inspired by the community module by tedialabs <https://github.com/tedilabs/terraform-aws-cloudfront>. We did not fork the module because we wanted to remove the cloudfront distribution creation and focus on the policies.

This module creates a set of AWS Cloudfront policies.

- [cache-policies](modules/cache)
- [origin-request-policies](modules/origin-request)
- [response-header-policies](modules/response-headers)

## Tests

Use `make test` to run the tests.
