provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webapp" {
  #resource "aws_instance" "myec2" {
  ami           = "ami-5b41123e"
  instance_type = "t2.micro"
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"
}

terraform {
  backend "s3" {
    bucket = "atin-remote-backend"
    key    = "state-management.tfstate"
    region = "us-east-1"
  }
}

### State Management Commands:

#### List the Resource with State File:
# terraform state list

#### Rename Resource within Terraform State
# 1. Change the local name of EC2 resource from webapp to myec2.
# 2. Run terraform plan to see the changes. It should destroy and recreate the EC2 instance.
# 3. Change the local name of EC2 within the terraform state file with following command:

# terraform state mv aws_instance.myec2 aws_instance.webapp

#### Pull Current State file
# terraform state pull

#### Remove Items from State file. Not from AWS
# terraform state rm aws_instance.myec2

## Will try to create the resource
# terraform plan

#### Show Attributes of Resource from state file
# terraform state show aws_iam_user.lb
