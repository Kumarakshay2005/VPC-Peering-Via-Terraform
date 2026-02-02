# Internet gateway for primary vpc
resource "aws_internet_gateway" "primary_igw" {
  vpc_id = aws_vpc.primary.id
  provider = aws.primary

  tags = {
    Name = "primary-${var.Name}-igw"
    Environment = var.Environment
    Created_by = var.Created_by
  }
  depends_on = [ aws_vpc.primary ]
}
# Internet gateway for secondary vpc
resource "aws_internet_gateway" "secondary_igw" {
  vpc_id = aws_vpc.secondary.id
  provider = aws.secondary
  tags = {
    Name = "secondary-${var.Name}-igw"
    Environment = var.Environment
    Created_by = var.Created_by
  }

  depends_on = [ aws_vpc.secondary ]
}