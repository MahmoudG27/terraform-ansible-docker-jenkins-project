resource "aws_security_group" "tf_ssh_access" {
  name_prefix = "ssh_access_"
  description = "Allow SSH Access from any IP address"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf_security-group22"
  }
}

resource "aws_security_group" "tf_ssh_and_3000" {
  name_prefix = "allow_ssh_and_3000_from_vpc_cidr_"
  description = "Allow SSH and port 3000 from VPC CIDR"

  vpc_id = module.network.vpc_id

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = module.network.vpc_cidr
  }

  ingress {
    description = "Port 3000 Access"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = module.network.vpc_cidr
  }

  tags = {
    Name = "tf_security-group_ssh_and_3000_from_vpc_cidr_sg"
  }
}
