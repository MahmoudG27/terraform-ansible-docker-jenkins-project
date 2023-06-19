resource "aws_instance" "tf_bastion" {

  ami           = var.ec2_ami
  instance_type = var.ec2_type
  subnet_id     = module.network.public_subnet_id1

  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "tf_nginx1" {

  ami           = var.ec2_ami
  instance_type = var.ec2_type
  subnet_id     = module.network.public_subnet_id1

  tags = {
    Name = "nginx"
  }
}

resource "aws_instance" "tf_nginx2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  subnet_id     = module.network.public_subnet_id2

  tags = {
    Name = "nginx2"
  }
}