resource "aws_security_group" "security_group_elesticache" {
  name        = "Security_gp_elasticache"
  vpc_id      = aws_vpc.main_vpc.id
  description = "grupo_de_seguranca_elesticache"

  ingress {
    from_port       = 11211
    to_port         = 11211
    protocol        = "tcp"
    security_groups = [aws_security_group.grupo_de_seguranca.id]
  }

  tags = {
    Name = "meu-elasticache-sgg"
  }

}

