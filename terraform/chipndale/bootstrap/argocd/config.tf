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
        # FIX 1: Provide your fully qualified Tailscale MagicDNS name
        # Replace <your-tailnet> with your actual Tailnet alias
        domain = "chipndale-argocd.unicorn-court.ts.net" 
      }
      configs = {
        params = {
          "server.insecure" = "true"
        }
      }
      server = {
        service = {
          type = "ClusterIP"
          # FIX 2: Move the Tailscale HTTP annotation to the Service
          annotations = {
            "tailscale.com/backend-protocol" = "HTTP"
          }
        }
        ingress = {
          enabled          = true
          ingressClassName = "tailscale"
          pathType         = "Prefix"
          # (Annotation removed from here)
        }
      }
      controller = {
        enableStatefulSet = false
      }
    })
  ]
}