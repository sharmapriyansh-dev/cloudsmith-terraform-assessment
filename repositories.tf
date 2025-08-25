# QA, Staging, Production repositories
resource "cloudsmith_repository" "qa" {
  name        = "QA"
  slug        = "qa"
  namespace   = var.organization
  description = "QA repository"
}

resource "cloudsmith_repository" "staging" {
  name        = "Staging"
  slug        = "staging"
  namespace   = var.organization
  description = "Staging repository"
}

resource "cloudsmith_repository" "production" {
  name                        = "Production"
  slug                        = "production"
  namespace                   = var.organization
  description                 = "Production repository"
  replace_packages_by_default = true
}
