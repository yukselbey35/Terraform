resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx-deployment"
    labels = {
      App = "nginx-deployment"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "nginx-deployment"
      }
    }
    template {
      metadata {
        labels = {
          App = "nginx-deployment"
        }
      }
      spec {
        container {
          image = "nginx:1.7.8"
          name  = "nginx-container"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
