# EC2 for primary vpc
resource "aws_instance" "aws_ec2_primary" {
    provider = aws.primary
    ami = data.aws_ami.ubuntu_primary.id
    instance_type = var.instance_type
    subnet_id = aws_subnet.primary_subnet.id
    vpc_security_group_ids = [aws_security_group.primary_sg.id]
    key_name = data.aws_key_pair.primary_ec2.key_name
  tags = {
    Name = "primary-${var.Name}-ec2"
    Environment = var.Environment
    Created_by = var.Created_by
  }
  depends_on = [ aws_vpc_peering_connection_accepter.secondary_accepter ]
}

# EC2 for secondary vpc 
resource "aws_instance" "aws_ec2_secondary" {
    provider = aws.secondary
    ami = data.aws_ami.ubuntu_secondary.id
    instance_type = var.instance_type
    subnet_id = aws_subnet.secondary_subnet.id
    vpc_security_group_ids = [aws_security_group.secondary_sg.id]
    key_name = data.aws_key_pair.secondary_ec2.key_name
  tags = {
    Name = "secondary-${var.Name}-ec2"
    Environment = var.Environment
    Created_by = var.Created_by
  }
  depends_on = [ aws_vpc_peering_connection_accepter.secondary_accepter ]
}