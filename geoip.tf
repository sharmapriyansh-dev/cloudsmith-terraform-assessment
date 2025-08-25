
# Geo/IP Rule to block all traffic from Russia (country code RU)
#
# Applies to downloads-based traffic per Cloudsmith docs.
resource "cloudsmith_repository_geo_ip_rules" "prod_geoip" {
  namespace  = var.organization
  repository = cloudsmith_repository.production.slug_perm

  country_code_deny = ["RU"]
}
