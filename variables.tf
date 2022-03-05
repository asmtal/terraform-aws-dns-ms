variable "zone_id" {
  type        = string
  description = "Route53 zone id"
}
variable "domain" {
  type        = string
  description = "Base fqdn. I.e. foo.bar"
}
variable "mx" {
  type        = string
  description = "Non default or computed MX host to use"
  default     = ""
}
