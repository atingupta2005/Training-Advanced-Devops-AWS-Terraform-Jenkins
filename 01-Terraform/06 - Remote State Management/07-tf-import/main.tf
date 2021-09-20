provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami                    = "ami-5b41123e"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-6ae7d613"]
  key_name               = "atingupta2005-terraform"
  subnet_id              = "subnet-9e3cfbc5"

  tags = {
    Name = "manual"
  }
}

### First create a ec2 instance
### Command To Import Resource. It will not generate the code as in file above. It will only generate tfstate. Need to create tf file ourself
### This command will link the state file with ec2 instance in aws
# terraform import aws_instance.myec2 i-041886ebb7e9bd20
