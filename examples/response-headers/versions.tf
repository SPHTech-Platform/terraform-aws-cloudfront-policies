terraform {
  required_version = ">= 1.3"

  required_providers {
    # tflint-ignore: terraform_unused_required_providers
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.38, < 6.0"
    }
  }
}
