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
    name = "example-deployment"
  }

  spec {
    replicas = 3

    strategy{
      type = "Recreate" 
    }

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
          image = "manoj3003/image05"  # Docker image to deploy
          name  = "example-container"
        }
        ports {
          containerPort = 8080  
        }
        resources {
            requests {
               cpu = "100m"
               memory = "64Mi"
            }
            limits {
               cpu = "100m"
               memory = "256Mi" 
            }
        }
      }
    }
  }
}

resource "kubernetes_service" "example" {
  metadata {
    name = "example-service"
  }

  spec {
    selector = {
      app = "example"
    }
    ports {
      protocol = "TCP"
      port     = 80
      target_port = 80
    }
    type = NodePort
  }
}

resource "kubernetes_horizontal_pod_autoscaler" "example" {
  metadata {
    name = "terraform-example"
  }

  spec {
    max_replicas = 10
    min_replicas = 8
    targetCPUUtilizationPercentage = 50

    scale_target_ref {
      kind = "Deployment"
      name = "MyApp"
    }
  }
}
