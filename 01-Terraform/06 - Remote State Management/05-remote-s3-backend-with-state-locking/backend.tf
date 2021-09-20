terraform {
  backend "s3" {
    bucket = "atin-remote-backend"
    key    = "remotedemo.tfstate"
    region = "us-east-1"
    # Create a table named s3-state-lock in dynamodb with primary key column named - LockID
    dynamodb_table = "s3-state-lock"
  }
}
