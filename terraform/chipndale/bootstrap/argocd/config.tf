resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.argocd.namespace
    labels = {
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }
}

# 2. Deploy Argo CD using Helm
resource "helm_release" "argocd" {
  depends_on = [kubernetes_namespace.argocd]
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "7.7.0" # Specify your desired chart version
  namespace        = kubernetes_namespace.argocd.metadata[0].name
  create_namespace = false

  # Wait for all resources to become ready before completing
  wait          = true
  wait_for_jobs = true
  timeout       = 600

  # (Optional) Override default chart values
# (Optional) Override default chart values
  values = [
    yamlencode({
      global = {
        domain = "chipndale-argocd.home.kenneth.ac" 
      }
      configs = {
        params = {
          "server.insecure" = "true"
        }
      }
      server = {
        ingress = {
          enabled          = true
          annotations = {
              "cert-manager.io/cluster-issuer" = "letsencrypt-cloudflare"
              "traefik.ingress.kubernetes.io/router.entrypoints" = "websecure"
          }
        }
      }
      controller = {
        enableStatefulSet = false
      }
    })
  ]
}