
output "repository_slugs" {
  value = {
    qa         = cloudsmith_repository.qa.slug_perm
    staging    = cloudsmith_repository.staging.slug_perm
    production = cloudsmith_repository.production.slug_perm
  }
}

output "service_account_slug" {
  value = cloudsmith_service.ci_bot.slug
}
