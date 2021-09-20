provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}


terraform {
  #  required_version = "~> 0.12.0"

  backend "remote" {}
}

resource "aws_iam_user" "lb" {
  name = "remoteuser"
  path = "/system/"
}


### CLI Commands used
# terraform login
# terraform init -backend-config=backend.hcl

### Documentation Referred:
# https://www.terraform.io/docs/backends/types/remote.html
