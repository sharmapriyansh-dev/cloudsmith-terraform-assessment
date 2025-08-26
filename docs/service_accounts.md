# Cloudsmith Service Account

## Task
This page details how I used the Cloudsmith Terraform provider to create a service account for using it later with OIDC.

### Terraform Example

````
provider "cloudsmith" {
 api_key = "my-api-key"
}

data "cloudsmith_organization" "my_org" {
 slug = "my-organization"
}

resource "cloudsmith_team" "my_team" {
 organization = data.cloudsmith_organization.my_org.slug
 name         = "My Team"
}

resource "cloudsmith_service" "my_service" {
 name         = "My Service"
 organization = data.cloudsmith_organization.my_org.slug

 team {
  slug = cloudsmith_team.my_team.slug
 }
}
````

#### Service account to be used with OIDC

````
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
````

#### Output

![Service Account](tfm-state-service-ci-bot.png)


