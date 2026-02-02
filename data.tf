data "aws_availability_zones" "primary" {
  provider = aws.primary
  state = "available"
}

data "aws_availability_zones" "secondary" {
    provider = aws.secondary
    state = "available"
}

data "aws_key_pair" "primary_ec2" {
  provider = aws.primary
  key_name           = "Primary-ec2-key"
  include_public_key = true

  filter {
    name   = "tag:Name"
    values = ["key-pair"]
  }
}

data "aws_key_pair" "secondary_ec2" {
  provider = aws.secondary
  key_name           = "Secondary-ec2-key"
  include_public_key = true

  filter {
    name   = "tag:Name"
    values = ["key-pair"]
  }
}

data "aws_ami" "ubuntu_primary" {
  provider = aws.primary
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  }

data "aws_ami" "ubuntu_secondary" {
  provider = aws.secondary
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  }
  