output "vault_kv_path" {
  description = "Mounted KV v2 secrets engine path"
  value       = vault_mount.kvv2.path
}

output "vault_kubernetes_auth_path" {
  description = "Enabled Kubernetes auth backend path"
  value       = vault_auth_backend.kubernetes.path
}

output "eso_policy_name" {
  description = "Least-privilege Vault policy attached to External Secrets Operator"
  value       = vault_policy.external_secrets.name
}

output "eso_role_name" {
  description = "Vault Kubernetes auth role bound to External Secrets Operator"
  value       = vault_kubernetes_auth_backend_role.external_secrets.role_name
}
