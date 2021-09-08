######################################
# AWS NAT Gateway variables
######################################
variable subnet-id {
  type = string
}

variable nat-gateway-depends-on {
  type    = any
  default = []
}

variable nat-gateway-name {
  type    = string
  default = "nat-gw"
}

variable "tags" {
  type    = map(string)
  default = {}
}
