output "id" {
  value = "${module.state_bucket.id}"
}

output "arn" {
  value = "${module.state_bucket.arn}"
}

output "bucket_domain_name" {
  value = "${module.state_bucket.bucket_domain_name}"
}

output "region" {
  value = "${module.state_bucket.region}"
}

output "key_id" {
  value = "${module.state_bucket.key_id}"
}

output "key_arn" {
  value = "${module.state_bucket.key_arn}"
}

output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "caller_user" {
  value = "${data.aws_caller_identity.current.user_id}"
}
