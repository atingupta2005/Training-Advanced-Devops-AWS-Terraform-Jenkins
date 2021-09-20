provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "aws02"
  region = "us-east-1"
}

#### 1st EIP -- one region
resource "aws_eip" "myeip" {
  vpc = "true"
}

#### 2nd EIP -- second region
resource "aws_eip" "myeip01" {
  vpc      = "true"
  provider = aws.aws02
}
