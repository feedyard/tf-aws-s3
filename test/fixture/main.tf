module "state_bucket" {
  source = "../.."

  name                = ["${var.test_names}"]
  account             = "${var.test_account}"
  extension           = "${var.test_extension}"
  enable_key_rotation = "${var.test_enable_key_rotation}"

  tags = {
    "test"     = "terraform module continuous integration testing"
    "pipeline" = "feedyard/tf-aws-state-bucket"
  }
}
