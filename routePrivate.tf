resource "aws_route_table" "tf_routePri" {

  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = "tf_routePri"
  }
}

resource "aws_route" "tf_routePri" {

  route_table_id         = aws_route_table.tf_routePri.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.tf_natgw.id
}

resource "aws_route_table_association" "tf_associate_pri1" {

  subnet_id      = aws_subnet.tf_private1.id
  route_table_id = aws_route_table.tf_routePri.id
}

resource "aws_route_table_association" "tf_associate_pri2" {

  subnet_id      = aws_subnet.tf_private2.id
  route_table_id = aws_route_table.tf_routePri.id
}