# Subnets for both primary and secondary VPC

# Subnet for primary vpc
resource "aws_subnet" "primary_subnet" {
  vpc_id              = aws_vpc.primary.id
  availability_zone   = data.aws_availability_zones.primary.names[0]
  cidr_block = var.primary_cidr
  provider = aws.primary
  map_public_ip_on_launch = true
  tags = {
    Name = local.primary-sb
    Environment = var.Environment
    Created_by = var.Created_by    
  }
}

# Subnet for secondary vpc
resource "aws_subnet" "secondary_subnet" {
  vpc_id              = aws_vpc.secondary.id
  availability_zone   = data.aws_availability_zones.secondary.names[0]
  cidr_block = var.secondary_cidr
  provider = aws.secondary
  map_public_ip_on_launch = true
  tags = {
    Name = local.secondary-sb
    Environment = var.Environment
    Created_by = var.Created_by
  }
}