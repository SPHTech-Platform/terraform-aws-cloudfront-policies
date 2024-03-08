mock_provider "aws" {
}

run "validate" {
  command = apply

  module {
    source = "../../examples/response-headers"
  }
}
