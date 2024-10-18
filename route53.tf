resource "aws_route53_record" "my_alias_record" {
  zone_id = "sua-zona-id"
  name    = "seu-dominio.com"
  type    = "A"

  alias {
    name                   = aws_lb.my_application_lb.dns_name
    zone_id                = aws_lb.my_application_lb.zone_id
    evaluate_target_health = true
  }
}