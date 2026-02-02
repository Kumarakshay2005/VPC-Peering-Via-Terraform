output "primary_fingerprint" {
  value = data.aws_key_pair.primary_ec2.fingerprint
}

output "primary_name" {
  value = data.aws_key_pair.primary_ec2.key_name
}

output "primary_id" {
  value = data.aws_key_pair.primary_ec2.id
}

output "secondary_fingerprint" {
  value = data.aws_key_pair.secondary_ec2.fingerprint
}

output "secondary_name" {
  value = data.aws_key_pair.secondary_ec2.key_name
}

output "secondary_id" {
  value = data.aws_key_pair.secondary_ec2.id
}