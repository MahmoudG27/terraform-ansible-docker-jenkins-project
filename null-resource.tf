resource "null_resource" "bastion-key" {
  provisioner "remote-exec" {
    inline = [
      "echo '${aws_key_pair.tf_keypair.public_key}' >> ~/.ssh/authorized_keys"
    ]

    connection {
      host        = aws_instance.tf_bastion.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.deploy_tls.private_key_openssh
    }
  }
}