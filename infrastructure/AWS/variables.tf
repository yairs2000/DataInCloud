###################################################
# This file holds all the main variables
###################################################
# locals
locals {
  environment = "dev"
  application = "DataInCloud"
  developer   = "Yair Segal"

  lambda-env = {
    Destination_Bucket = ""
  }
}

#general
variable "region" {
  default = "us-east-1"
}

variable "accountId" {
}

#s3
variable "bucket-names" {
  type    = list(string)
  default = ["raw", "validated", "processed"]
}

#lambda
variable "LambdaIamRoleName" {
  type    = string
  default = "Serverless-DataInCloud"
}

variable "lambdaFunctionName" {
  type    = string
  default = "DIC-LambdaS3Transfer"

}

variable "lambdaHandler" {
  type    = string
  default = "Transfers3Data::Transfers3Data.Function::FunctionHandler"
}

variable "lambdaZipPath" {
  type    = string
  default = "../../Lambdas/Transfers3Data/Transfers3Data/bin/Release/netcoreapp3.1/Transfers3Data.zip"

}

