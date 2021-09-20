
terraform {
  backend "s3" {
    bucket         = "atingupta2005-remote-backend"
    key            = "ec2demo.tfstate"
    region         = "us-east-1"
    dynamodb_table = "s3-state-lock"
  }
}
