variable "bucket_name" {
  description = "Name of the bucket"
  type        = string
}

variable "enable_versioning" {
  description = "Enable bucket versioning - cannot be turned off once on"
  type        = string
  default     = "Disabled"
}

variable "tags" {
  description = "Defaults to no tags."
  type        = map(string)
  default = {
    "tag" = "none given"
  }
}