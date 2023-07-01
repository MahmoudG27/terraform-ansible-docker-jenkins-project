resource "aws_instance" "tf_bastion" {

  ami           = var.ec2_ami
  instance_type = var.ec2_type
  subnet_id     = module.network.public_subnet_id1
  security_groups = aws_security_group.tf_ssh_access

  provisioner "local-exec" {
    command = "echo the servers ip is ${self.public_ip}"
  }

  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "tf_nginx" {

  ami           = var.ec2_ami
  instance_type = var.ec2_type
  subnet_id     = module.network.public_subnet_id1
  security_groups = aws_security_group.tf_ssh_and_3000

  tags = {
    Name = "nginx"
  }
}