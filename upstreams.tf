# QA: NPM + Maven
resource "cloudsmith_repository_upstream" "qa_npm" {
  namespace  = var.organization
  repository = cloudsmith_repository.qa.slug_perm

  name          = "npm-official"
  upstream_type = "npm"
  upstream_url  = "https://registry.npmjs.org"

  mode       = "Cache and Proxy"
  is_active  = true
  verify_ssl = true
}

resource "cloudsmith_repository_upstream" "qa_maven" {
  namespace  = var.organization
  repository = cloudsmith_repository.qa.slug_perm

  name          = "maven-central"
  upstream_type = "maven"
  upstream_url  = "https://repo1.maven.org/maven2"

  mode       = "Cache and Proxy"
  is_active  = true
  verify_ssl = true
}

# Staging: Python (PyPI)
resource "cloudsmith_repository_upstream" "staging_pypi" {
  namespace  = var.organization
  repository = cloudsmith_repository.staging.slug_perm

  name          = "pypi-official"
  upstream_type = "python"
  upstream_url  = "https://pypi.org/simple"

  mode       = "Cache and Proxy"
  is_active  = true
  verify_ssl = true
}

# Production: intentionally no upstreams
