resource "aws_subnet" "tf_private1" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.private1-cidr
  availability_zone = var.az1

  tags = {
    Name = "tf_private1"
  }
}

resource "aws_subnet" "tf_private2" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.private2-cidr
  availability_zone = var.az2

  tags = {
    Name = "tf_private2"
  }
}