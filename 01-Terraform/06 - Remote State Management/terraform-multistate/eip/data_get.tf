
data "terraform_remote_state" "myec2" {
  backend = "s3"
  config {
    bucket = "atingupta2005-remote-backend"
    key    = "ec2demo.tfstate"
    region = "us-east-1"
  }
}
