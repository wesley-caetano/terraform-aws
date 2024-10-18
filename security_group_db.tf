resource "aws_security_group" "db_grupo_de_seguranca" {
  name        = "meu_db_grupo_de_seguranca"
  description = "db_grupo_de_seguranca"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.grupo_de_seguranca.id]
  }

  tags = {
    Name = "banco-rds-sgg"
  }

}


