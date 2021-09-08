###################################################
# This file holds all the main variables
###################################################
variable "region" {
    default = "us-east-1"
}

variable "accountId"{
    default = "583338675555"
}

variable "bucket-names"{
    type = list(string)
    default=["raw", "validated", "processed"]
}
