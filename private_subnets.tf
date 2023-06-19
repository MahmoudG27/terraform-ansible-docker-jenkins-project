resource "aws_subnet" "tf_private1" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf_private1"
  }
}

resource "aws_subnet" "tf_private2" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tf_private2"
  }
}