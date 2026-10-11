resource "confluent_provider_integration_authorization" "provider_integration_authorizations" {
  for_each = var.provider_integration_authorizations

  provider_integration_id = each.value.provider_integration_id

  environment {
    id = each.value.environment.id
  }

  dynamic "azure" {
    for_each = each.value.azure != null ? [each.value.azure] : []
    content {
      customer_azure_tenant_id = azure.value.customer_azure_tenant_id
    }
  }

  dynamic "gcp" {
    for_each = each.value.gcp != null ? [each.value.gcp] : []
    content {
      customer_google_service_account = gcp.value.customer_google_service_account
    }
  }
}

