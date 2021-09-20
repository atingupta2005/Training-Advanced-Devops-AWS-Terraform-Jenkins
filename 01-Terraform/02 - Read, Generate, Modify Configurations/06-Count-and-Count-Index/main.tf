provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "instance-1" {
  ami           = "ami-5b41123e"
  instance_type = "t2.micro"
  count         = 3
}

variable "elb_names" {
  type    = list(any)
  default = ["dev-loadbalancer", "stage-loadbalanacer", "prod-loadbalancer"]
}

resource "aws_iam_user" "lb" {
  name  = var.elb_names[count.index]
  count = 3
  path  = "/system/"
}


output "iam_names" {
  value = aws_iam_user.lb[*].name
}

output "iam_arn" {
  value = aws_iam_user.lb[*].arn
}
