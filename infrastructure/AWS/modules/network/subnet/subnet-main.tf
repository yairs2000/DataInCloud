################################################
# Create an AWS Subnet for a VPC
################################################

# Create a public subnet for the requested AZ's and CIDR
resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc-id
  availability_zone       = var.availability-zone
  cidr_block              = var.subnet-cidr
  map_public_ip_on_launch = true
  depends_on              = [var.subnet-depends-on]

  tags = {
    for k, v in merge({
      Name = "public-${var.availability-zone}"
    }, var.tags) : k => lower(v)
  }
}

# Create a NAT gateway and Elastic IP
# the internet gateway
module "nat-gateway" {
  count                  = var.needs-nat-gateway ? 1 : 0
  source                 = "../../nat-gateway"
  nat-gateway-name       = "${var.availability-zone}-nat-gateway"
  subnet-id              = aws_subnet.public-subnet.id
  nat-gateway-depends-on = [aws_subnet.public-subnet]
  tags                   = var.tags
}

# Create and associate a route tablewith subnet
module "public-routes" {
  source                 = "../../route-table"
  route-table-name       = "public-${var.availability-zone}-route"
  subnet-id              = aws_subnet.public-subnet.id
  vpc-id                 = var.vpc-id
  internet-gateway-id    = var.internet-gateway-id
  route-table-depends-on = [aws_subnet.public-subnet.id]
  tags                   = var.tags
}


# NACL
# traffic in and out of the subnets.
resource "aws_network_acl" "public-network-acl" {
  vpc_id     = var.vpc-id
  subnet_ids = [aws_subnet.public-subnet.id]

  egress {
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
  }

  ingress {
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
  }

  depends_on = [aws_subnet.public-subnet]

  tags = {
    for k, v in merge({
      Name = "public-${var.availability-zone}-NACL"
    }, var.tags) : k => lower(v)
  }
}
