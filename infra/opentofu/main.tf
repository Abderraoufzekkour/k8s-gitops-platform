provider "vault" {
  address = var.vault_address
}

resource "vault_mount" "kvv2" {
  path        = "secret"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine managed by OpenTofu"
}

resource "vault_auth_backend" "kubernetes" {
  type        = "kubernetes"
  path        = "kubernetes"
  description = "Kubernetes JWT authentication for External Secrets Operator"
}

resource "vault_policy" "external_secrets" {
  name = "external-secrets-policy"

  policy = <<EOT
path "secret/data/my-app/*" {
  capabilities = ["read"]
}
EOT
}

resource "vault_kubernetes_auth_backend_role" "external_secrets" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "external-secrets"
  bound_service_account_names      = [var.eso_service_account]
  bound_service_account_namespaces = [var.eso_namespace]
  token_ttl                        = 3600
  token_policies                   = [vault_policy.external_secrets.name]
}
