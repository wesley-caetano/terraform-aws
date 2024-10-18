resource "aws_launch_template" "my_launch_template" {
  name_prefix   = "my-template"
  image_id      = "ami-023e5ae7830ad6447"
  instance_type = "t2.micro"

  
  key_name = var.chave_name


  network_interfaces {
    security_groups = [aws_security_group.grupo_de_seguranca.id]
  }
}
