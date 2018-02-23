variable "env" {
  description = "Envrionment for the Terraform, staging | production"
}

provider "aws" {
  region = "us-west-1"
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

resource "aws_instance" "web" {
  ami               = "abc134"
  instance_type     = "t2.micro"
  availability_zone = "us-west-1a"

  tags {
    Name = "HelloWorld"
  }
}

resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "iam:PassRole"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
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

