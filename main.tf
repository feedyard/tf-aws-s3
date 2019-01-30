# Encrypted s3 buckets for storing terraform state files (or similar)
#
resource "random_pet" "unique" {
  length    = 2
  separator = "-"
}

resource "aws_kms_key" "bucket_key" {
  description             = "key managed by terraform moduile tf-aws-state-bucket"
  deletion_window_in_days = "${var.deletion_window_in_days}"
  enable_key_rotation     = "${var.enable_key_rotation}"
}

resource "aws_kms_alias" "bucket_key_alias" {
  name          = "alias/managed-by/tf-aws-state-bucket/${random_pet.unique.id}"
  target_key_id = "${aws_kms_key.bucket_key.id}"
}

resource "aws_s3_bucket" "mod" {
  count  = "${(length(var.name))}"

  bucket = "${var.name[count.index]}"
  acl    = "${var.acl}"

  versioning {
    enabled = "${var.versioning}"
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

# not clear how this adds value in addtional to OU level policy
//resource "aws_s3_bucket_public_access_block" "mod" {
//  bucket = "${aws_s3_bucket.mod.*.id}"
//
//  block_public_acls   = true
//  block_public_policy = true
//}
