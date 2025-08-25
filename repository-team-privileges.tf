# Repository privileges — Teams only
# Ref: cloudsmith_repository_privileges (teams)

# QA: Write for Dev, DevOps, Admin
resource "cloudsmith_repository_privileges" "qa_teams" {
  organization = data.cloudsmith_organization.org.slug
  repository   = cloudsmith_repository.qa.slug

  team {
    slug      = cloudsmith_team.dev.slug
    privilege = "Write"
  }

  team {
    slug      = cloudsmith_team.devops.slug
    privilege = "Write"
  }

  team {
    slug      = cloudsmith_team.admin.slug
    privilege = "Write"
  }
}

# Staging: Write for Dev, DevOps, Admin
resource "cloudsmith_repository_privileges" "staging_teams" {
  organization = var.organization
  repository   = cloudsmith_repository.staging.slug

  team {
    slug      = cloudsmith_team.dev.slug
    privilege = "Write"
  }

  team {
    slug      = cloudsmith_team.devops.slug
    privilege = "Write"
  }

  team {
    slug      = cloudsmith_team.admin.slug
    privilege = "Write"
  }
}

# Production: Admin/Write for Admin, Read for DevOps, none for Dev
resource "cloudsmith_repository_privileges" "production_teams" {
  organization = var.organization
  repository   = cloudsmith_repository.production.slug

  team {
    slug      = cloudsmith_team.admin.slug
    privilege = "Write" # Change to "Admin" if you want full admin
  }

  team {
    slug      = cloudsmith_team.devops.slug
    privilege = "Read"
  }

  # No Dev access to Production
}
