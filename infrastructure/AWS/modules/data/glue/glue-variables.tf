###################################################
# variables for glue database and crawler creation
###################################################
variable "glueCatalogName" {
    type = string
    description = "The name for the glue catalog"
}

variable "glueCrawlerName" {
    type = string
    description = "The name for the glue crawler"
}

variable "cralwlerS3Target" {
    type = string
    description = "The name of the s3 bucket the crawler will target"
}

variable "IAMRoleArn" {
    type = string
    description = "The arn for the Iam role for glue"
}