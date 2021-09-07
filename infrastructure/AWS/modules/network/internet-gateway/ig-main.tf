###############################################
# Create an AWS Internet Gateway for a VPC
###############################################
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id     = var.vpc-id
  depends_on = [var.internet-gateway-depends-on]

  tags = {
    for k, v in merge({
      Name = var.internet-gateway-name
    }, var.tags) : k => lower(v)
  }
}