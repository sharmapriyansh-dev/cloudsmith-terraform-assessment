# Dev team
resource "cloudsmith_team" "dev" {
  organization = var.organization
  name         = "Dev"
  slug         = "dev"
}

# DevOps team
resource "cloudsmith_team" "devops" {
  organization = var.organization
  name         = "DevOps"
  slug         = "devops"
}

# Admin team
resource "cloudsmith_team" "admin" {
  organization = var.organization
  name         = "Admin"
  slug         = "admin"
}
