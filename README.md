# feedyard/tf-aws-state-bucket

Create an S3 bucket for terraform state files or similar potentially secure information that requires both an encrypted  
bucket and logging.  

## Usage

```
module "state_bucket" {
  source                   = "github/feedyard/tf-aws-state-bucket"

  name                   = "feedyard-terraform-state"
  log_bucket             = "feedyard-cloudtrail-logs"
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
| log_bucket | where to send logging | string | - | yes |
| log_target_prefix | prefix to add to automated logs | string | `tf-state-log` | no |
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

