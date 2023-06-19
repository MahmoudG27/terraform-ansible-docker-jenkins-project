resource "aws_route_table" "tf_routePub" {

  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    Name = "tf_routePub"
  }
}

resource "aws_route" "tf_routePub" {

  route_table_id         = aws_route_table.tf_routePub.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.tf_gw.id

}

resource "aws_route_table_association" "tf_associate_pub1" {

  subnet_id      = aws_subnet.tf_public1.id
  route_table_id = aws_route_table.tf_routePub.id
}

resource "aws_route_table_association" "tf_associate_pub2" {

  subnet_id      = aws_subnet.tf_public2.id
  route_table_id = aws_route_table.tf_routePub.id
}