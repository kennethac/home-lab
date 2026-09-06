variable "argocd" {
  type = object({
    namespace = optional(string, "argocd")
  })
}
