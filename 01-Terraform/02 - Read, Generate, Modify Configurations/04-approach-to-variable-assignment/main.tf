provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-5b41123e"
  instance_type = var.instancetype
}
