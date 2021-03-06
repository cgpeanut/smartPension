# Set S3 backend for persisting TF state file remotely, ensure bucket already exits
# And that AWS user being used by Terraform has read/write permissions.

terraform {
  required_version = ">=0.12.0"
  required_providers {
    aws = ">=3.0.0"
  }
  backend "s3" {
    region  = "us-east-1"
    profile = "default"
    key     = "terraformstatefile"
    bucket  = "smartpensionpersistantbucket1005"
  }
}
