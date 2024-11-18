resource "aws_instance" "public_vm" {
  ami           = "ami-0445c16713918964e"  # Use a valid AMI ID for your region
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = aws_key_pair.deployer_key_pair.key_name

  tags = {
    Name = "PublicVM"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install nginx -y",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/id_rsa")
      host        = self.public_ip
    }
  }
}

resource "aws_instance" "private_vm" {
  ami           = "ami-0445c16713918964e"  # Use a valid AMI ID for your region
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private_subnet.id
  key_name      = aws_key_pair.deployer_key_pair.key_name

  tags = {
    Name = "PrivateVM"
  }
}
