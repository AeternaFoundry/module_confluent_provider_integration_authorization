variable "provider_integration_authorizations" {
  description = <<EOT
Map of provider_integration_authorizations, attributes below
Required:
    - provider_integration_id
    - environment (block):
        - id (required)
Optional:
    - azure (block):
        - customer_azure_tenant_id (required)
    - gcp (block):
        - customer_google_service_account (required)
EOT

  type = map(object({
    provider_integration_id = string
    environment = object({
      id = string
    })
    azure = optional(object({
      customer_azure_tenant_id = string
    }))
    gcp = optional(object({
      customer_google_service_account = string
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

