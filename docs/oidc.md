# Cloudsmith OIDC 

## Task
This page details how I used the Cloudsmith Terraform provider to create an OIDC for the GitHub Actions repository using the service account we created in this assessment.


#### Terraform Example

````
provider "cloudsmith" {
    api_key = "my-api-key"
}

data "cloudsmith_organization" "org" {
    slug = "my-organization"
}

resource "cloudsmith_service" "oidc_static" {
    name         = "oidc-static"
    organization = data.cloudsmith_organization.org.slug
}

resource "cloudsmith_oidc" "static" {
    namespace        = data.cloudsmith_organization.org.slug_perm
    name             = "My OIDC (static)"
    enabled          = true
    provider_url     = "https://token.actions.githubusercontent.com/"
    service_accounts = [
        cloudsmith_service.oidc_static.slug,
    ]

    claims = {
        aud = "cloudsmith"
    }
}
````

#### OIDC connect for GitHub Actions with repository claims

````
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
````

#### Output

![OIDC Connect](tfm-state-service-oidc-github.png)
