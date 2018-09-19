module "state_bucket" {
  source = "../.."

  name                = "${var.test_name}"
  enable_key_rotation = "${var.test_enable_key_rotation}"
  log_bucket          = "${var.test_log_bucket}"

  tags = {
    "test"     = "terraform module continuous integration testing"
    "pipeline" = "feedyard/tf-aws-state-bucket"
  }
}
