resource "aws_route53_zone" "routezone" {
  name          = var.domain_name
  force_destroy = true
}
# Route 53 A Record
resource "aws_route53_record" "route53_record" {
  zone_id = aws_route53_zone.routezone.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = aws_lb.k8s-alb.dns_name
    zone_id                = aws_lb.k8s-alb.zone_id
    evaluate_target_health = false
  }
}