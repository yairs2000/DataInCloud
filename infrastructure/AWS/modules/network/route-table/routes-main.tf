##########################################################################
# Create an AWS Route Table for an  Internet gateway or for a NAT Gateway.
##########################################################################
resource "aws_route_table" "route-table" {
  vpc_id = var.vpc-id

  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id     = var.internet-gateway-id
    nat_gateway_id = var.nat-gateway-id
  }
  depends_on = [var.route-table-depends-on]

  tags = {
    for k, v in merge({
      Name = var.route-table-name
    }, var.tags) : k => lower(v)
  }
}

#############################################
# Associate an AWS subnet with a Route Table
#############################################
resource "aws_route_table_association" "subnet-route-table-association" {
  subnet_id      = var.subnet-id
  route_table_id = aws_route_table.route-table.id
}
