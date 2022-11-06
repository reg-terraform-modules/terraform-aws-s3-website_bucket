locals {
  s3_website_bucket_arn = join("",["arn:aws:s3:::",var.bucket_name,"-",var.env,"/*"])
}

data "template_file" "website_policy" {
  template = file("${path.module}/iam/website_bucket_policy.json")
  vars = {
    s3_website_bucket_arn = local.s3_website_bucket_arn
  }
}