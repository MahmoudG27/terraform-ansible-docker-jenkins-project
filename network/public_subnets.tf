resource "aws_subnet" "tf_public1" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.public1-cidr
  map_public_ip_on_launch = true
  availability_zone       = var.az1

  tags = {
    Name = "tf_public1"
  }
}

resource "aws_subnet" "tf_public2" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.public2-cidr
  map_public_ip_on_launch = true
  availability_zone       = var.az2

  tags = {
    Name = "tf_public2"
  }
}