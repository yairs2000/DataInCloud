####################
# AWS VPC Variables
####################
variable vpc-name {
  type        = string
  description = "Name for the VPC"
}

variable vpc-cidr {
  type        = string
  description = "CIDR block for the VPC"
}

variable enable-dns-hostnames {
  type        = bool
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  default     = true
}

variable enable-dns-support {
  type        = bool
  description = "A boolean flag to enable/disable DNS support in the VPC"
  default     = true
}

variable enable-classiclink {
  type        = bool
  description = "A boolean flag to enable/disable ClassicLink for the VPC"
  default     = false
}

variable enable-classiclink-dns-support {
  type        = bool
  description = "A boolean flag to enable/disable ClassicLink DNS Support for the VPC"
  default     = false
}

variable create-internet-gateway {
  type        = bool
  description = "A boolean flag to control Internet Gateway creation"
  default     = true
}

variable tags {
  type        = map(string)
  description = "Tags to be added to the VPC"
  default     = {}
}
