###############################
# Get details of the AWS Subnet
###############################
output "public_subnet_id" {
  description = "ID of the created subnet"
  value       = aws_subnet.public-subnet.id
}

output "public_subnet_cidr" {
  description = "CIDR block of the subnet"
  value       = aws_subnet.public-subnet.cidr_block
}

output "availability_zone" {
  description = "Availability Zone for subnet"
  value       = var.availability-zone
}

output "public_route_table_id" {
  description = "IDs of the route table"
  value       = module.public-routes.*.route_table_id
}

output "nat_eip_id" {
  description = "Elastic IP for the nat gateway"
  value       = module.nat-gateway.*.nat_eip_id
}

output "nat_gateway_id" {
  description = "IDs of the nat gateways"
  value       = module.nat-gateway.*.nat_gateway_id
}

output "nat_gateway" {
  description = "IDs of the nat gateways"
  value = {
    "id" : length(module.nat-gateway) > 0 ? module.nat-gateway[0].nat_gateway_id : ""
    "zone" : var.availability-zone
  }
}