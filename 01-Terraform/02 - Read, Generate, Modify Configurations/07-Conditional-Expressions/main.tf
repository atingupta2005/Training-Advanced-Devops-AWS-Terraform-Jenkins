provider "aws" {
  region = "us-east-1"
}

variable "istest" {
  default = true
}

resource "aws_instance" "dev" {
  ami           = "ami-5b41123e"
  instance_type = "t2.micro"
  count         = var.istest == true ? 3 : 0
}

resource "aws_instance" "prod" {
  ami           = "ami-5b41123e"
  instance_type = "t2.large"
  count         = var.istest == false ? 1 : 0
}
