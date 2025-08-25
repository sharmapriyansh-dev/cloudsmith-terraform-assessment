# Repository privileges — Service Accounts
# Ref: cloudsmith_repository_privileges (service accounts)

# Example: give CI/CD service accounts access to repos
# Adjust privileges as needed for your pipelines.

resource "cloudsmith_repository_privileges" "qa_sa" {
  organization = data.cloudsmith_organization.org.slug
  repository   = cloudsmith_repository.qa.slug

  service {
    slug      = cloudsmith_service.ci_bot.slug
    privilege = "Write"
  }
}

resource "cloudsmith_repository_privileges" "staging_sa" {
  organization = data.cloudsmith_organization.org.slug
  repository   = cloudsmith_repository.staging.slug

  service {
    slug      = cloudsmith_service.ci_bot.slug
    privilege = "Write"
  }
}

resource "cloudsmith_repository_privileges" "production_sa" {
  organization = var.organization
  repository   = cloudsmith_repository.production.slug

  service {
    slug      = cloudsmith_service.ci_bot.slug
    privilege = "Read" # or "Write" if deployments go direct
  }
}
