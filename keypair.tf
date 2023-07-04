resource "tls_private_key" "rsa" {
  algorithm   = "RSA"
  rsa_bits    = 2048
}
resource "aws_key_pair" "tf_keypair" {

  key_name   = "tf_keypair"
  public_key = tls_private_key.rsa.public_key_openssh
}