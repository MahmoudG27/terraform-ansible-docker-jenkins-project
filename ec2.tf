resource "aws_instance" "tf_bastion" {

  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  subnet_id              = module.network.public_subnet_id1
  key_name               = aws_key_pair.tf_keypair.key_name
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  provisioner "local-exec" {
    command = <<-EOT
      ssh-copy-id -i ${tls_private_key.rsa.private_key_pem} ubuntu@${self.public_ip};
      echo ${tls_private_key.rsa.private_key_pem}  >> privatekey.pem;
      echo '[bastion]\n ansible_host='${self.public_ip} 'ansible_ssh_private_key_file= privatekey.pem'  >> ./ansible/inventory;
    EOT
  }

  tags = {
    Name = "bastion"
  }
}

resource "aws_instance" "tf_application" {

  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  subnet_id              = module.network.private_subnet_id1
  key_name               = aws_key_pair.tf_keypair.key_name
  vpc_security_group_ids = [aws_security_group.application_sg.id]

  provisioner "local-exec" {
    command = "echo '[application]\n ansible_host'${self.private_ip} 'ansible_ssh_common_args= -o ProxyCommand= ssh -W %h:%p -q ubuntu@'${aws_instance.tf_bastion.public_ip} -i privatekey.pem >> ./ansible/inventory"
  }

  tags = {
    Name = "app"
  }
}