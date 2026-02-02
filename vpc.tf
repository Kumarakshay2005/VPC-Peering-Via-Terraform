# VPC'S for both Primary and Secondary Region
# Primary VPC for Primary Region
resource "aws_vpc" "primary" {
  cidr_block       = var.primary_cidr
  provider = aws.primary
  instance_tenancy = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support

  tags = {
    Name = local.primary
    Environment = var.Environment
    Created_by = var.Created_by
  }
}

# Secondary VPC for Secondary Region
resource "aws_vpc" "secondary" {
  cidr_block       = var.secondary_cidr
  provider = aws.secondary
  instance_tenancy = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support

  tags = {
    Name = local.secondary
    Environment = var.Environment
    Created_by = var.Created_by
  }
}