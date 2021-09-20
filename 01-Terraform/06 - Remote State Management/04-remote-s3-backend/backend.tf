terraform {
  backend "s3" {
    bucket = "atin-remote-backend"
    key    = "remotedemo.tfstate"
    region = "us-east-1"
  }
}
