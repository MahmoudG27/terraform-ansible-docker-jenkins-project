resource "aws_db_instance" "tf_rds" {
  identifier          = "example"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "Mahmoud27"
  allocated_storage    = 10
  storage_type         = "gp2"
  db_subnet_group_name = aws_db_subnet_group.tf_db_subnet.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}