####################################
# Get ID of created Internet Gateway
####################################
output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}
