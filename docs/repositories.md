# Cloudsmith Repositories

## Task
This page details how I used the Cloudsmith Terraform provider for repository operations in my organization. All outputs are evidenced by corresponding screenshots. Repositories that were created were:

- QA
- Staging
- Production

---

Terraform example:

```
provider "cloudsmith" {
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
```

### Terraform Code Snippet

#### 1. QA

````
resource "cloudsmith_repository" "qa" {
  name        = "QA"
  slug        = "qa"
  namespace   = var.organization
  description = "QA repository"
}
````
#### Output:

![QA Repository](tfm-state-qa-repo.png)

#### 2. Staging

````
resource "cloudsmith_repository" "staging" {
  name        = "Staging"
  slug        = "staging"
  namespace   = var.organization
  description = "Staging repository"
}
````
#### Output:

![QA Repository](tfm-state-staging-repo.png)

### 3. Production

```
resource "cloudsmith_repository" "production" {
  name                        = "Production"
  slug                        = "production"
  namespace                   = var.organization
  description                 = "Production repository"
  replace_packages_by_default = true
}

````

#### Output:

![QA Repository](tfm-state-prod-repo.png)
