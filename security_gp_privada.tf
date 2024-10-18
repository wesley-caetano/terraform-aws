resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.main_vpc.id

  
  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    security_groups = [aws_security_group.vpn_sg.id]
  }

 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.vpn_sg.id]
  }

  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.vpn_sg.id]
  }

  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-sgg"
  }
}



