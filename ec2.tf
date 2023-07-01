resource "aws_instance" "tf_bastion" {

  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  subnet_id              = module.network.public_subnet_id1
  key_name = module.network.keyname
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  provisioner "local-exec" {
    command = "echo '[bastion]\n${self.public_ip}' ansible_ssh_private_key_file=../terraform-key.pem  >> ./ansible/inventory"
  }

  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "tf_application" {

  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  subnet_id              = module.network.private_subnet_id1
  key_name = module.network.keyname
  vpc_security_group_ids = [aws_security_group.application_sg.id]

  provisioner "local-exec" {
    command = "echo '[application]\n${self.public_ip}' ansible_ssh_private_key_file=../terraform-key.pem  >> ./ansible/inventory"
  }

  tags = {
    Name = "app"
  }
}