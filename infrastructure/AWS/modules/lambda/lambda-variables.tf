###############################
# AWS lambda variables
###############################

variable "lambdaFileName" {
  description = "Zip file name that stores the lambda function"
  type        = string
}

variable "lambdaFunctionName" {
  description = "A name for the lambda function"
  type        = string
}

variable "envVariables"{
    description = "A list of environment variables"
    type        = map(string) 
}

variable "IamRoleName" {
    description = "The name for the Iam role that runs the lambda"
    type = string
  
}

variable "lambdaHandler" {
    description = "The entry point to the lambda function"
    type        = string 
}