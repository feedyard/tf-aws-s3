terraform {
  required_version = ">= 0.11.11"
}

provider "aws" {
  version = ">= 1.57"
  region  = "${var.aws_region}"
}

variable "aws_region" {
  default = "us-east-1"
}

# bucket name
variable "test_names" {
  type = "list"
}

variable "test_account" {}
variable "test_extension" {}
variable "test_enable_key_rotation" {}
