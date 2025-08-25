# Create service account (ci-bot)
resource "cloudsmith_service" "ci_bot" {
  name         = "ci-bot"
  organization = var.organization
  description  = "Service account used by CI/CD"

  team {
    slug = cloudsmith_team.devops.slug
    role = "Member"
  }
}
