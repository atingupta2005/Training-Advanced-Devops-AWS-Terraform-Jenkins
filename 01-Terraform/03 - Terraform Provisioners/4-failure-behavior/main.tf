### Important Note:
#Make sure to have the private key file present in the working directory for the provisioner to be able to connect to the instance.

### Code:
provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myec2" {
  ami                    = "ami-5b41123e"
  instance_type          = "t2.micro"
  key_name               = "atingupta2005-terraform"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "sudo yum -y install nano"
    ]
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }
}
