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

variable "accountId"{
    default = "583338675555"
}

#s3
variable "bucket-names"{
    type = list(string)
    default=["raw", "validated", "processed"]
}

#lambda
variable "LambdaIamRoleName" {
    type = string
    default = "Serverless-DataInCloud"
}

variable "lambdaFunctionName" {
    type = string
    default = "DIC-LambdaS3Transfer"
  
}

