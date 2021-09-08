####################################
# Get Details of the S3 Bucket
####################################
output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = aws_s3_bucket.s3-bucket.arn
}

output "s3_bucket_id" {
  description = "The id of the bucket."
  value       = aws_s3_bucket.s3-bucket.id
}

output "s3_bucket_name" {
  description = "The Name of the bucket."
  value       = aws_s3_bucket.s3-bucket.bucket
}