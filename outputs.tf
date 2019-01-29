# aws_s3_bucket resource id
output "id" {
  value = "${aws_s3_bucket.mod.*.id}"
}

# aws_s3_bucket resource arn
output "arn" {
  value = "${aws_s3_bucket.mod.*.arn}"
}

# aws_s3_bucket resource url
output "bucket_domain_name" {
  value = "${aws_s3_bucket.mod.*.bucket_domain_name}"
}

# aws_s3_bucket resource region
output "region" {
  value = "${aws_s3_bucket.mod.*.region}"
}

# kms key id of key used to encrypt bucket
output "key_id" {
  value = "${aws_kms_key.bucket_key.key_id}"
}

# kms key arn of key used to encrypt bucket
output "key_arn" {
  value = "${aws_kms_key.bucket_key.arn}"
}
