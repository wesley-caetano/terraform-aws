resource "aws_instance" "private_ec2" {
  ami             = "ami-005fc0f236362e99f"
  instance_type   = var.tipo_instancia
  subnet_id       = aws_subnet.subnet_priv_docker.id
  security_groups = [aws_security_group.private_sg.id]
  key_name        = var.chave_name

  user_data = base64encode(templatefile("${path.module}/templatefile/hello.sh", {

  }))

  tags = {
    Name = "Private-EC2-Nginx"
  }
}