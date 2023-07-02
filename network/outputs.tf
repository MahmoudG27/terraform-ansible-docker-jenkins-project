output "public_subnet_id1" {
  value = aws_subnet.tf_public1.id
}

output "public_subnet_id2" {
  value = aws_subnet.tf_public2.id
}

output "private_subnet_id1" {
  value = aws_subnet.tf_private1.id
}

output "private_subnet_id2" {
  value = aws_subnet.tf_private2.id
}

output "vpc_cidr" {
  value = aws_vpc.tf_vpc.cidr_block
}

output "vpc_id" {
  value = aws_vpc.tf_vpc.id
}