############################################
# Create an AWS VPC
############################################
resource "aws_vpc" "vpc" {
  count                          = var.use-default ? 0 : 1
  cidr_block                     = var.vpc-cidr
  enable_dns_hostnames           = var.enable-dns-hostnames
  enable_dns_support             = var.enable-dns-support
  enable_classiclink             = var.enable-classiclink
  enable_classiclink_dns_support = var.enable-classiclink-dns-support

  tags = {
    for k, v in merge({
      Name = "${var.vpc-name}-vpc"
    }, var.tags) : k => lower(v)
  }
}

############################################
# Create an Internet Gateway for the VPC
############################################
module "internet_gateway" {
  count                       = var.create-internet-gateway ? 1 : 0
  source                      = "../internet-gateway"
  vpc-id                      = join("", aws_vpc.vpc.*.id)
  internet-gateway-name       = "${var.vpc-name}-internet-gateway"
  internet-gateway-depends-on = [aws_vpc.vpc]
  tags                        = var.tags
  depends_on                  = [aws_vpc.vpc]
}
