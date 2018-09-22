# name given to new bucket
variable "name" {}

# access control list
variable "acl" {
  default = "private"
}

# Enable versioning?
variable "versioning" {
  default = "true"
}

# delay before deleting kms key used to encrypt bucket objects when removing resource
variable "deletion_window_in_days" {
  default = "7"
}

# enable automatic, annual key rotation
variable "enable_key_rotation" {
  default = "false"
}

# encyption algorithm
variable "sse_algorithm" {
  default = "aws:kms"
}

# A map of tags to add to all resources
variable "tags" {
  default = {}
}
