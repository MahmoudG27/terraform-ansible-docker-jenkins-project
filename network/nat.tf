
resource "aws_eip" "tf_eip" {
  tags = {
    Name = "tf_eip"
  }
}

resource "aws_nat_gateway" "tf_natgw" {
  allocation_id = aws_eip.tf_eip.id
  subnet_id     = aws_subnet.tf_public1.id

  tags = {
    Name = "tf_natgw"
  }

}