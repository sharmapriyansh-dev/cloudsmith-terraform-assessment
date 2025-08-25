terraform {
  required_providers {
    cloudsmith = {
      source  = "cloudsmith-io/cloudsmith"
      version = "0.0.60"
    }
  }
}

provider "cloudsmith" {
  api_key = var.cloudsmith_api_key
}

# Namespace/org lookup used by most resources
data "cloudsmith_organization" "org" {
  slug = var.organization
}
