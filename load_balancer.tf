resource "aws_lb" "my_application_lb" {
  name               = "my-application-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.securi-lb.id]
  subnets            = [aws_subnet.subnet_public_a.id, aws_subnet.subnet_public_b.id]

  enable_deletion_protection = false


  tags = {
    Name = "MyAppALB"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.my_application_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

data "aws_acm_certificate" "my_certificate" {
  domain   = "seu-dominioo.com"
  statuses = ["ISSUED"]
}

resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.my_application_lb.arn
  port              = 443
  protocol          = "HTTPS"

  ssl_policy      = "ELBSecurityPolicy-2016-08"
  certificate_arn = data.aws_acm_certificate.my_certificate.arn

  default_action {
    type = "forward"

    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}