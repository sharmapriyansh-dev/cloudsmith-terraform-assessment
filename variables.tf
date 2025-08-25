variable "cloudsmith_api_key" {
  description = "Cloudsmith API key"
  type        = string
  sensitive   = true
}

variable "organization" {
  description = "Cloudsmith organization slug"
  type        = string
}
