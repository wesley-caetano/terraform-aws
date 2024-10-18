resource "aws_db_subnet_group" "grupo_db" {
  name       = "subnet_banco_de_dados"
  subnet_ids = [aws_subnet.subnet_priv_a.id, aws_subnet.subnet_priv_b.id]
}

resource "aws_db_instance" "mysql_db" {
  identifier             = "data-base"
  db_name                = var.nome_db
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7.44"
  instance_class         = "db.t3.micro"
  username               = var.user_db
  password               = var.senha_db
  publicly_accessible    = false
  skip_final_snapshot    = true
  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.grupo_db.id
  vpc_security_group_ids = [aws_security_group.db_grupo_de_seguranca.id]
}
