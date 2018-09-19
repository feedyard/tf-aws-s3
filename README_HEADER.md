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
