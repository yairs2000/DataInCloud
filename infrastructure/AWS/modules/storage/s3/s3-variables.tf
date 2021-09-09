###############################
# AWS S3 Bucket variables
###############################
variable "bucket" {
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name."
  type        = string
}

variable "acl" {
  description = "(Optional) The canned ACL to apply. Defaults to 'private'."
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "(Optional, Default:false ) A boolean that enables bucket versioning."
  type        = bool
  default     = false
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to assign to the resource"
}
