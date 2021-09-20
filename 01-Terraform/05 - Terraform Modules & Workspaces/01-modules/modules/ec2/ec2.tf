variable "instance_type" {
  default = "t2.micro"
}

resource "aws_instance" "myec2" {
  ami           = "ami-5b41123e"
  instance_type = var.instance_type
}
