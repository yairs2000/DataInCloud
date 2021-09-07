####################################
# Get Details of created AWS resources
####################################
output "vpc_id" {
  value       = join("", aws_vpc.vpc.*.id)
  description = "The ID of the VPC"
}

output "internet_gateway_id" {
  value       = join("", module.internet_gateway.*.internet_gateway_id)
  description = "The ID of the Internet Gateway"
}

output "vpc_cidr_block" {
  value       = join("", aws_vpc.vpc.*.cidr_block)
  description = "The CIDR block of the VPC"
}
