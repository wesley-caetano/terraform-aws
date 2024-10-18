
# security group vpn 


resource "aws_security_group" "vpn_sg" {
  vpc_id = aws_vpc.main_vpc.id


  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.meu_ip]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.meu_ip]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpn-sg"
  }
}

# ec2

resource "aws_instance" "vpn_ec2" {
  ami             = "ami-005fc0f236362e99f"
  instance_type   = var.tipo_instancia
  subnet_id       = aws_subnet.subnet_public_vpc.id
  security_groups = [aws_security_group.vpn_sg.id]
  key_name        = var.chave_name

  tags = {
    Name = "vpn-server"
  }

  user_data = base64encode(templatefile("${path.module}/templatefile/vpn.sh", {

  }))

}

