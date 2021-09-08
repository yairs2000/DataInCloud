###############################################
# Create an AWS Elastic IP.
###############################################
resource "aws_eip" "nat" {
  vpc = true
}

###############################################
# Create a NAT Gateway using the Elastic IP.
###############################################
resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.subnet-id
  depends_on    = [var.nat-gateway-depends-on]

  tags = {
    for k, v in merge({
      Name = var.nat-gateway-name
    }, var.tags) : k => lower(v)
  }
}
