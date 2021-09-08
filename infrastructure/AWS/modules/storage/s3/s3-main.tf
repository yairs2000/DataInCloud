########################
# Create a S3 Buckegt
########################
resource "aws_s3_bucket" "s3-bucket" {
  bucket              = var.bucket
  acl                 = var.acl
  tags                = var.tags
 

  versioning {
    enabled = var.versioning
  }

}
