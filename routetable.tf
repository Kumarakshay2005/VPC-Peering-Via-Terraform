# Route-tables for Primary and secondary vpc and their association with respective to their subnet

# Route-table for primary vpc
resource "aws_route_table" "primary_routetable" {
  vpc_id = aws_vpc.primary.id
  provider = aws.primary

  route {
    cidr_block = var.cidr_block_route
    gateway_id = aws_internet_gateway.primary_igw.id
  }
  tags = {
    Name = "primary-${var.Name}-routetable"
    Environment = var.Environment
    Created_by = var.Created_by
  }
}

# Route-table for secondary vpc
resource "aws_route_table" "secondary_routetable" {
  vpc_id = aws_vpc.secondary.id
  provider = aws.secondary

  route {
    cidr_block = var.cidr_block_route
    gateway_id = aws_internet_gateway.secondary_igw.id
  }
  tags = {
    Name = "secondary-${var.Name}-routetable"
    Environment = var.Environment
    Created_by = var.Created_by
  }
}

# Route Association for primary vpc
resource "aws_route_table_association" "primary_assocation" {
  subnet_id      = aws_subnet.primary_subnet.id
  route_table_id = aws_route_table.primary_routetable.id
  provider = aws.primary
}

# Route Association for Secondary vpc
resource "aws_route_table_association" "secondary_association" {
  subnet_id      = aws_subnet.secondary_subnet.id
  route_table_id = aws_route_table.secondary_routetable.id
  provider = aws.secondary
}

# Defining the route for vpc-peering from primary-to-secondary & secondary-to-primary

# Route for primary-to-secondary
resource "aws_route" "primary-to-secondary" {
  provider = aws.primary
  route_table_id = aws_route_table.primary_routetable.id
  destination_cidr_block = var.secondary_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary_requestor.id
  depends_on = [ aws_vpc_peering_connection_accepter.secondary_accepter ]
}
# Route for secondary-to-primary
resource "aws_route" "secondary-to-primary" {
  provider = aws.secondary
  route_table_id = aws_route_table.secondary_routetable.id
  destination_cidr_block = var.primary_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary_requestor.id
  depends_on = [ aws_vpc_peering_connection_accepter.secondary_accepter ]
}