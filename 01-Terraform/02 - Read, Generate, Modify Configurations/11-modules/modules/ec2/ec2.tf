resource "aws_instance" "myec2" {
  ami           = "ami-5b41123e"
  instance_type = var.instance_type
}
