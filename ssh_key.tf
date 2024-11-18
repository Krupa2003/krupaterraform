resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "${path.module}/id_rsa"
}

resource "aws_key_pair" "deployer_key_pair" {
  key_name   = "deployer-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}
