######################################
# AWS Route Table variables
######################################
variable vpc-id {
  type = string
}

variable internet-gateway-id {
  type    = string
  default = null
}

variable nat-gateway-id {
  type    = string
  default = null
}

variable route-table-name {
  type    = string
  default = "routing-table-1"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable route-table-depends-on {
  type    = any
  default = []
}

#######################################
# AWS Route Table association variables
#######################################
variable subnet-id {
  type = string
}
