resource "tls_private_key" "deploy_tls" {

    algorithm = "RSA"
    rsa_bits  = 4096

}

resource "aws_key_pair" "tf_keypair" {

    key_name   = "tf_keypair"
    public_key = tls_private_key.deploy_tls.public_key_openssh
}