# feedyard/tf-aws-state-bucket

Terraform module to create an S3 bucket for terraform state files or similar secure information that requires   
server side encryption, non-public access restriction, and object versioning. KMS key is aliased with  
"managed-by/<module>/random_pet" for identification.  

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
