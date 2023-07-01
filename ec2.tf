resource "aws_instance" "tf_bastion" {

  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  subnet_id              = module.network.public_subnet_id1
  key_name = module.network.keyname
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  provisioner "local-exec" {
    command = "echo the servers ip is ${self.public_ip}"
  }

  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "tf_application" {

  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  subnet_id              = module.network.public_subnet_id1
  key_name = module.network.keyname
  vpc_security_group_ids = [aws_security_group.application_sg.id]

  tags = {
    Name = "nginx"
  }
}