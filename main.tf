# Encrypted s3 buckets for storing terraform state files (or similar)
resource "aws_kms_key" "bucket_key" {
  description             = "key managed by terraform moduile tf-aws-state-bucket"
  deletion_window_in_days = "${var.deletion_window_in_days}"
  enable_key_rotation     = "${var.enable_key_rotation}"
}

resource "aws_kms_alias" "bucket_key_alias" {
  name          = "alias/terraform-module/tf-aws-state-bucket"
  target_key_id = "${aws_kms_key.bucket_key.id}"
}

resource "aws_s3_bucket" "mod" {
  bucket = "${var.name}"
  acl    = "${var.acl}"

  versioning {
    enabled = "${var.versioning}"
  }

  logging {
    target_bucket = "${var.log_bucket}"
    target_prefix = "${var.log_target_prefix}/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.bucket_key.arn}"
        sse_algorithm     = "${var.sse_algorithm}"
      }
    }
  }

  tags = "${var.tags}"
}
