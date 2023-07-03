resource "aws_db_subnet_group" "tf_rds_subnet" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids_rds
}

resource "aws_db_instance" "tf_rds" {
  identifier                  = "my-rds-instance"
  engine                      = "mysql"
  engine_version              = "8.0.23"
  instance_class              = var.instance_class
  allocated_storage           = 20
  storage_type                = "gp2"
  username                    = var.username-rds
  password                    = var.password-rds
  db_subnet_group_name        = aws_db_subnet_group.tf_rds_subnet.name
  vpc_security_group_ids      = [aws_security_group.rds_sg.id]
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = true
  publicly_accessible         = false
}

resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "null_resource" "output_rds" {
  provisioner "local-exec" {
    command = "echo 'RDS_HOSTNAME='${aws_db_instance.tf_rds.endpoint}\n'RDS_PORT='${aws_db_instance.tf_rds.port}\n'RDS_PASSWORD='${aws_db_instance.tf_rds.password}\n'RDS_USERNAME='${aws_db_instance.tf_rds.username}  >> ./ENV-rds-redis"
  }
}