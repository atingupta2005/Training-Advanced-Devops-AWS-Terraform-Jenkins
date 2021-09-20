### Different Version Parameters used:
#version    = "2.7"
#version    = ">= 2.8"
#version    = "<= 2.8"
#version    = ">=2.10,<=2.30"

### Base Configuration - provider.versioning.tf

provider "aws" {
  region  = "us-east-1"
  version = ">=2.10,<=2.30"
}

resource "aws_instance" "myec2" {
  ami           = "ami-5b41123e"
  instance_type = "t2.micro"
}
