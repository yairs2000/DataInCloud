####################################################
# create glue database and cralwer
####################################################

resource "aws_glue_catalog_database" "aws_glue_catalog_database" {
  name = var.glueCatalogName
}

#create the glue craler
resource "aws_glue_crawler" "getValidatedData" {
  database_name = var.glueCatalogName
  name          = var.glueCrawlerName
  role          = var.IAMRoleArn

  s3_target {
    path = var.cralwlerS3Target#"s3://${aws_s3_bucket.example.bucket}"
  }
}