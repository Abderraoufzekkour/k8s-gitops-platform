variable "vault_address" {
  description = "URL of the HashiCorp Vault server"
  type        = string
  default     = "http://127.0.0.1:8200"
}

variable "kubernetes_host" {
  description = "Internal Kubernetes API server URL used by Vault for TokenReview"
  type        = string
  default     = "https://kubernetes.default.svc"
}

variable "eso_namespace" {
  description = "Namespace where External Secrets Operator is deployed"
  type        = string
  default     = "external-secrets"
}

variable "eso_service_account" {
  description = "ServiceAccount name used by External Secrets Operator"
  type        = string
  default     = "external-secrets"
}
