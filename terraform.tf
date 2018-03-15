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

resource "aws_s3_bucket" "a" {
  bucket = "nic-sentinel-my-tf-test-bucket"
  acl    = "private"

  tags {
    Name        = "My bucket"
    Environment = "Dev"
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

*/
variable "workspace" {
  description = "Allow the override of the workspace, for example if running on TFE workspace is not present"
  default     = ""
}

# Set workspace value to a local variable,
# config will depend on the variable not directly depend on the workspace.
# This is useful due to the differences in TFE and OSS, this approach will not require
# replacement of hard coded workspace values when migrating a config to TFE.
# https://www.terraform.io/docs/configuration/locals.html
locals {
  workspace = "${coalesce("${terraform.workspace}", "${var.workspace}")}"
}

# Local variables can be referenced with the ${local.name} interpolation syntax
output "workspace" {
  value = "${local.workspace}"
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

