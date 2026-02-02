# Peering connections Between Primary-to-Secondary(Requestor-to-Accepter) VPC
# VPC Peering connection for Primary(requestor) VPC side
resource "aws_vpc_peering_connection" "primary_to_secondary_requestor" {  
  peer_vpc_id   = aws_vpc.secondary.id
  vpc_id        = aws_vpc.primary.id
  peer_region = var.secondary
  provider = aws.primary
  auto_accept = false
  tags = {
    Name = "primary-${var.Name}-requestor"
    Environment = var.Environment
    Created_by = var.Created_by
  }
}
# VPC Peering connection for Secondary(accepter) VPC side
resource "aws_vpc_peering_connection_accepter" "secondary_accepter" {
  vpc_peering_connection_id = aws_vpc_peering_connection.primary_to_secondary_requestor.id
  provider = aws.secondary
  auto_accept   = true
  tags = {
    Name = "secondary-${var.Name}-accepter"
    Environment = var.Environment
    Created_by = var.Created_by
  }  
}