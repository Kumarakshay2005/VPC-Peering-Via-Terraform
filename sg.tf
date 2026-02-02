# Security-Group and their rules for both primary and secondary EC2 machine

# Security-Group and rules for primary EC2
resource "aws_security_group" "primary_sg" {
  name        = "primary_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.primary.id
  provider = aws.primary

  tags = {
    Name = "primary-${var.Name}-sg"
    Environment = var.Environment
    Created_by = var.Created_by
  }
  depends_on = [ aws_vpc.primary ]
# Primary Security-Group inbound rule
dynamic "ingress" {
  for_each = var.ingress_primary
  content {
    description = ingress.value.description
    from_port   = ingress.value.from_port
    to_port     = ingress.value.to_port
    protocol    = ingress.value.protocol
    cidr_blocks = ingress.value.cidr_blocks
  }
}
# Primary Security-Group outbound rule
dynamic "egress" {
  for_each = var.egress
  content {
    description = egress.value.description
    from_port   = egress.value.from_port
    to_port     = egress.value.to_port
    protocol    = egress.value.protocol
    cidr_blocks = egress.value.cidr_blocks
  }
}
}

# Security-Group and rules for secondary EC2
resource "aws_security_group" "secondary_sg" {
  name        = "secondary_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.secondary.id
  depends_on = [ aws_vpc.secondary ]
  provider = aws.secondary

  tags = {
    Name = "secondary-${var.Name}-sg"
    Environment = var.Environment
    Created_by = var.Created_by
  }
# Secondary Security-Group inbound rule
dynamic "ingress" {
  for_each = var.ingress_secondary
  content {
    description = ingress.value.description
    from_port   = ingress.value.from_port
    to_port     = ingress.value.to_port
    protocol    = ingress.value.protocol
    cidr_blocks = ingress.value.cidr_blocks
  }
}

# Secondary Security-Group outbound rule
dynamic "egress" {
  for_each = var.egress
  content {
    description = egress.value.description
    from_port   = egress.value.from_port
    to_port     = egress.value.to_port
    protocol    = egress.value.protocol
    cidr_blocks = egress.value.cidr_blocks
  }
}

}
