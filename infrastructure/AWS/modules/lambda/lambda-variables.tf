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