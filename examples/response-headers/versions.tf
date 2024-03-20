terraform {
  required_version = ">= 1.3"

  # tflint-ignore: terraform_unused_required_providers
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.38"
    }
  }
}
