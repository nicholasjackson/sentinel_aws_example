variable "env" {
  description = "Envrionment for the Terraform, staging | production"
}

provider "aws" {
  region = "us-east-1"
}

/*
provider "aws" {
  alias  = "west"
  region = "us-west-1"
}
*/

resource "aws_s3_bucket" "a" {
  bucket = "nic-sentinel-my-tf-test-bucket"
  acl    = "private"

  tags {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

/*
resource "aws_s3_bucket" "b" {
  provider = "aws.west"

  bucket = "nic-sentinel-my-tf-test-bucket2"
  acl    = "private"

  tags {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
*/

