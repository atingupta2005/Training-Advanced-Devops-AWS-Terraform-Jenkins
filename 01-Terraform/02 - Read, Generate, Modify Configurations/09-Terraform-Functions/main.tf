#Can use terraform console to play around with various functions
provider "aws" {
  region = "us-east-1"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}

variable "itype" {
  type = map(any)
  default = {
    "us-east-1"  = "t2.micro"
    "us-east-1"  = "t2.nano"
    "us-east-1" = "t2.small"
  }
}

# How to generate rsa
#ssh-keygen  -f ./id_rsa
resource "aws_key_pair" "loginkey" {
  key_name   = "atingupta2005-terraform"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
  # Retrieves a value of a single element from a map given its key.
  # lookup(map, key, default value)
  ami           = "ami-5b41123e"
  instance_type = lookup(var.itype, var.region)
  key_name      = aws_key_pair.loginkey.key_name
  count         = 2

  tags = {
    Name = element(var.tags, count.index)
  }
}


output "timestamp" {
  value = local.time
}
