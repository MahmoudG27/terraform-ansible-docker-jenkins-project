resource "aws_db_subnet_group" "tf_db_subnet" {
  name        = "tf_db_subnet"
  subnet_ids  = ["subnet-12345678", "subnet-87654321"]
  tags = {
    Name = "My DB subnet group"
  }
}