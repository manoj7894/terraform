provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  config_path = "~/.kube/config"  # Path to your kubeconfig file
}

resource "null_resource" "build_and_push" {
  provisioner "local-exec" {
    command = "./build_and_push.sh"
  }
}

resource "kubernetes_deployment" "example" {
  metadata {
    name = "example"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "example"
      }
    }

    template {
      metadata {
        labels = {
          app = "example"
        }
      }

      spec {
        container {
          image = "manoj3003/image05:latest"
          name  = "nginx"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "0.25"
              memory = "256Mi"
            }
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "example" {
  metadata {
    name = "example"
  }

  spec {
    selector = {
      app = "example"
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}


resource "kubernetes_horizontal_pod_autoscaler" "example" {
  metadata {
    name = "example"
  }

  spec {
    max_replicas = 5
    min_replicas = 1

    metric {
      type = "Resource"
      resource {
        name = "cpu"
        target {
          type               = "Utilization"
          average_utilization = 50
        }
      }
    }

    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = kubernetes_deployment.example.metadata[0].name
    }
  }
}


