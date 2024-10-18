resource "aws_security_group" "security_group_efs" {
  name        = "Security-group-efs"
  vpc_id      = aws_vpc.main_vpc.id
  description = "grupo-de-seguranca-efs"

  ingress {
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.grupo_de_seguranca.id]
  }

  tags = {
    Name = "meu-efs-sgg"
  }

}
