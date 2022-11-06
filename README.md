# Resource/function: s3/website_bucket

## Purpose
Generic code for generating public s3 buckets for website

## Description
Generates website s3 buckets.

## Terraform functions

### Data sources

### Resources
- `aws_s3_bucket`
    - generates the bucket
- `aws_s3_bucket_acl`
    - Provides an S3 bucket ACL resource.
- `aws_s3_bucket_versioning`
    - Provides a resource for controlling versioning on an S3 bucket. Deleting this resource will either suspend versioning on the associated S3 bucket or simply remove the resource from Terraform state if the associated S3 bucket is unversioned.
- `aws_s3_bucket_website_configuration`
    - Provides an S3 bucket website configuration resource.
- `aws_s3_bucket_policy`
    - Attaches a policy to an S3 bucket resource.

## Input variables
### Required
- `bucket_name`
    - defines the name of the bucket

### Optional (default values used unless specified)
- `tags`
    - tags added to role - should be specified jointly with all other resources in the same module
    - default: `"tag" = "none given"`
- `bucket_acl`
    - Canned acl to be used - see https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl for options
    - default: `"public-read"`
- `enable_versioning`
    - String for enabling bucket versioning - cannot be turned off once on, can be suspended
    - default: `disabled`


## Output variables
- `arn`
    - `arn` of the generated bucket
- `name`
    - `name` of the generated bucket
- `id`
    - `id` of the generated bucket

## Example use
The below example generates a bucket using default input where available.
```sql
module "bucket_website" {
  source  = "app.terraform.io/renovasjonsetaten/s3-website_bucket/aws"
  version = "0.0.4"
  env         = var.env
  bucket_name = var.bucket_name_prefix
  tags        = var.resource_tags  
}
```

## Further work
