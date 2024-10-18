resource "aws_efs_file_system" "meu_efs" {
  creation_token = "meu-efs-aws"

  tags = {

    Name = "meu-efs"
  }
}

resource "aws_efs_mount_target" "efs-priv-1" {
  file_system_id  = aws_efs_file_system.meu_efs.id
  subnet_id       = aws_subnet.subnet_priv_a.id
  security_groups = [aws_security_group.security_group_efs.id]
}

resource "aws_efs_mount_target" "efs-priv-2" {
  file_system_id  = aws_efs_file_system.meu_efs.id
  subnet_id       = aws_subnet.subnet_priv_b.id
  security_groups = [aws_security_group.security_group_efs.id]
}