resource "aws_instance" "ec2_publica" {
  ami           = var.ami_linux
  instance_type = var.tipo_instancia
  subnet_id     = aws_subnet.subnet_public_a.id

  key_name               = var.chave_name
  vpc_security_group_ids = [aws_security_group.grupo_de_seguranca.id]

  tags = {
    Name = "Ec2_publica"
  }
  user_data = base64encode(templatefile("${path.module}/templatefile/setup.sh", {
    db_name            = aws_db_instance.mysql_db.db_name
    db_username        = aws_db_instance.mysql_db.username
    db_password        = aws_db_instance.mysql_db.password
    db_address         = aws_db_instance.mysql_db.address
    memcached_endpoint = aws_elasticache_cluster.my_elasticache.configuration_endpoint
    efs_endpoint       = aws_efs_file_system.meu_efs.dns_name
  }))
}





