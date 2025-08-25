
# Service account to be used with OIDC
resource "cloudsmith_service" "oidc_github" {
  name         = "oidc-github"
  organization = var.organization
}

# OIDC provider config
resource "cloudsmith_oidc" "github_actions" {
  namespace    = data.cloudsmith_organization.org.slug_perm
  name         = "GitHub Actions OIDC"
  enabled      = true
  provider_url = "https://token.actions.githubusercontent.com/"
  service_accounts = [
    cloudsmith_service.oidc_github.slug,
  ]

  claims = {
    repository_owner = "sharmapriyansh-dev"
  }
}
