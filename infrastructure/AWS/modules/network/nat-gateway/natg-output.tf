################################
# Get ID of Elastic IP created
################################
output "nat_eip_id" {
  value = aws_eip.nat.id
}

################################
# Get ID of created NAT Gateway
################################
output "nat_gateway_id" {
  value = aws_nat_gateway.nat-gateway.id
}
