variable "primary_cidr" {
    type = string
    default = "10.0.0.0/16"  
}
variable "instance_tenancy" {
  type = string
  default = "default"
}
variable "enable_dns_hostnames" {
  type = bool
  default = true
}
variable "enable_dns_support" {
  type = bool
  default = true
}
variable "Name" {
    type = string
    default = "resource"
  
}
variable "Environment" {
    type = string
    default = "staging"
  
}
variable "Created_by" {
    type = string
    default = "Terraform"
  
}
variable "primary" {
  type = string
  default = "ap-south-1"
}
variable "secondary" {
  type = string
  default = "eu-central-1"
}
variable "secondary_cidr" {
  type = string
  default = "196.168.0.0/16"
}
variable "cidr_block_route" {
  type = string
  default = "0.0.0.0/0"
}
variable "ingress_primary" {
  type = list(object({
    description = string
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
  }
  ))
  default = [ {
    description = "SSH from anywhere"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "ICMP from Secondary VPC"
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["196.168.0.0/16"]
  },
  {
    description = "All traffic from Secondary VPC"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["196.168.0.0/16"]
  }
   ]
}

variable "ingress_secondary" {
  type = list(object({
    description = string
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
  }
  ))
  default = [ {
    description = "SSH from anywhere"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "ICMP from Primary VPC"
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["10.0.0.0/16"]
  },
  {
    description = "All traffic from Primary VPC"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
   ]
}
variable "egress" {
  type = list(object({
    description = string
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
  }
  ))
  default = [ {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ]
}

variable "instance_type"{
  type = string
  default = "t3.small"
}