##############################################################
# The main Terraform file. This file does the following
# 1. Create the 3 S3 buckets raw, validated, processed
#
##############################################################

provider "aws" {
    region = "${var.region}"
}

#Create 3 s3 buckets
module "s3" {
    source = "./modules/storage/s3"
    count = length(var.bucket-names)
    bucket = format("%s-%s", var.bucket-names[count.index], var.accountId)       
}

#Create lambda to pass files from 1 S3 to another
module "Lambda" {
    source = "./modules/lambda"
    lambdaFileName = ""
    lambdaFunctionName = ""
    envVariables = ""
}
