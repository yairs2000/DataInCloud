#######################
# AWS Subnet Variables
#######################
variable vpc-id {
  type        = string
  description = "VPC ID where subnets will be created"
}

variable "needs-nat-gateway" {
  default     = false
  description = "Should we add a nat gateway(s) to pass to the private networks"
}

variable subnet-cidr {
  type        = string
  description = "Base CIDR block which will be divided into subnet CIDR blocks (e.g. `10.0.0.0/16`)"
}

variable availability-zone {
  type        = string
  description = "Availability Zone where subnets will be created"
}

variable subnet-depends-on {
  type    = any
  default = []
}

variable internet-gateway-id {
  type        = string
  default     = null
  description = "Internet Gateway ID the public route table, if provided, routes will be created."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to be added to the Subnet"
}
