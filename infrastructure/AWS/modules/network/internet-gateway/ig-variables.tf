######################################
# AWS Internet Gateway variables
######################################
variable internet-gateway-name {
  type    = string
  default = "internet-gw"
}

variable internet-gateway-depends-on {
  type    = any
  default = []
}

variable vpc-id {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
