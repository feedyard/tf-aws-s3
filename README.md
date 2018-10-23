# feedyard/tf-aws-state-bucket

Terraform module to create an S3 bucket for terraform state files or similar secure information that requires both  
server side encryption and object versioning. KMS key is aliased with "managed-by/<module>/random_pet" for identification.  

## Usage

```
module "state_bucket" {
  source                 = "github/feedyard/tf-aws-state-bucket"

  name                   = "feedyard-terraform-state"
  enable_key_rotation    = "True"
  
  tags = {
    "feedyard" = "True"
    "pipeline" = "feedyard/aws-bootstrap-resources"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| acl | access control list | string | `private` | no |
| deletion_window_in_days | delay before deleting kms key used to encrypt bucket objects when removing resource | string | `7` | no |
| enable_key_rotation | enable automatic, annual key rotation | string | `false` | no |
| name | name given to new bucket | string | - | yes |
| sse_algorithm | encyption algorithm | string | `aws:kms` | no |
| tags | A map of tags to add to all resources | string | `<map>` | no |
| versioning | Enable versioning? | string | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | aws_s3_bucket resource arn |
| bucket_domain_name | aws_s3_bucket resource url |
| id | aws_s3_bucket resource id |
| key_arn | kms key arn of key used to encrypt bucket |
| key_id | kms key id of key used to encrypt bucket |
| region | aws_s3_bucket resource region |

