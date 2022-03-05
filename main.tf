resource "aws_route53_record" "ms-mx" {
  name    = "${var.domain}."
  type    = "MX"
  ttl     = 300
  zone_id = var.zone_id
  records = ["25 ${var.mx != "" ? var.mx : local.cleanedFqdn}.mail.protection.outlook.com."]
}
resource "aws_route53_record" "ms-txt" {
  name    = "${var.domain}."
  type    = "TXT"
  ttl     = 300
  zone_id = var.zone_id
  records = ["v=spf1 include:spf.protection.outlook.com -all"]
}
resource "aws_route53_record" "ms-sip-fed-tls" {
  name    = "_sipfederationtls._tcp"
  type    = "SRV"
  ttl     = 300
  zone_id = var.zone_id
  records = ["100 1 5061 sipfed.online.lync.com."]
}
resource "aws_route53_record" "ms-sip-tls" {
  name    = "_sip._tls"
  type    = "SRV"
  ttl     = 300
  zone_id = var.zone_id
  records = ["100 1 443 sipdir.online.lync.com."]
}
resource "aws_route53_record" "ms-autodiscover" {
  name    = "autodiscover"
  type    = "CNAME"
  ttl     = 300
  zone_id = var.zone_id
  records = ["autodiscover.outlook.com."]
}
resource "aws_route53_record" "ms-enterprisereg" {
  name    = "enterpriseregistration"
  type    = "CNAME"
  ttl     = 300
  zone_id = var.zone_id
  records = ["enterpriseregistration.windows.net."]
}
resource "aws_route53_record" "ms-enrollment" {
  name    = "enterpriseenrollment"
  type    = "CNAME"
  ttl     = 300
  zone_id = var.zone_id
  records = ["enterpriseenrollment-s.manage.microsoft.com."]
}
resource "aws_route53_record" "ms-lyncdiscover" {
  name    = "lyncdiscover"
  type    = "CNAME"
  ttl     = 300
  zone_id = var.zone_id
  records = ["webdir.online.lync.com."]
}
resource "aws_route53_record" "ms-sip" {
  name    = "sip"
  type    = "CNAME"
  ttl     = 300
  zone_id = var.zone_id
  records = ["sipdir.online.lync.com."]
}
locals {
  cleanedFqdn = replace(var.domain, ".", "-")
}
