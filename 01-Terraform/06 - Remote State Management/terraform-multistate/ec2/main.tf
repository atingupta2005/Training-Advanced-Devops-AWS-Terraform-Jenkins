resource "aws_instance" "myec2" {
  ami           = "ami-5b41123e"
  instance_type = "t2.micro"
  key_name      = "atingupta2005-terraform"

  tags {
    Name = "remote-states"
  }

}

output "ec2ip" {
  value = aws_instance.myec2.id
}
