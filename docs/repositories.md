# Cloudsmith Repositories

## Task
This page details how I used the Cloudsmith Terraform provider for repository operations in my organization. All outputs are evidenced by corresponding screenshots. Repositories that were created were:

- QA
- Staging
- Production

---

Terraform example
`provider "cloudsmith" {
    api_key = "my-api-key"
}

data "cloudsmith_organization" "my_organization" {
    slug = "my-organization"
}

resource "cloudsmith_repository" "my_repository" {
    description = "A certifiably-awesome private package repository"
    name        = "My Repository"
    namespace   = "${data.cloudsmith_organization.my_organization.slug_perm}"
    slug        = "my-repository"
}
`

