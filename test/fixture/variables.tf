# backend.conf is setup at the start based on target account
terraform {
  required_version = ">= 0.11.8"
}

provider "aws" {
  version = ">= 1.36"
  region  = "${var.aws_region}"
}

variable "aws_region" {
  default = "us-east-1"
}

# bucket name
variable "test_name" {}

variable "test_enable_key_rotation" {}
variable "test_log_bucket" {}

data "aws_caller_identity" "current" {}
