
resource "aws_lb_target_group" "my_target_group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main_vpc.id


  health_check {
    protocol = "HTTP"
    path     = "/"
    matcher  = "302"
  }


  target_type = "instance"
}