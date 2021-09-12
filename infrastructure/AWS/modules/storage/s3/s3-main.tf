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

resource "aws_s3_bucket_policy" "b" {
  bucket = aws_s3_bucket.s3-bucket.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression's result to valid JSON syntax.
  policy = jsonencode({
  Id = "Policy1631243474168"
  Version = "2012-10-17"
  Statement = [
    {
      Sid = "Stmt1631243471998"
      Action = [
        "s3:PutObject", "s3:GetObject", "s3:ListBucket" 

      ]
      Effect = "Allow"
      Resource = [
          aws_s3_bucket.s3-bucket.arn,
          "${aws_s3_bucket.s3-bucket.arn}/*",
        ]
      Principal = "*"
    }
  ]
})
}
