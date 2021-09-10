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
    lambdaFileName = "../../Lambdas/Transfers3Data/Transfers3Data/bin/Release/netcoreapp3.1/Transfers3Data.zip" #C:\Users\Aden\Documents\GitHub\DataInCloud\Lambdas\Transfers3Data\Transfers3Data\bin\Release\netcoreapp3.1
    lambdaFunctionName = var.lambdaFunctionName
    envVariables =  {
                        Destination_Bucket = module.s3[1].s3_bucket_name
                     }
    IamRoleName = var.LambdaIamRoleName
}


resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name =  module.Lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = module.s3[0].s3_bucket_arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = module.s3[0].s3_bucket_arn

  lambda_function {
    lambda_function_arn = module.Lambda.arn
    events              = ["s3:ObjectCreated:*"]
  }
}
