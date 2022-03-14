terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}
provider "kubernetes" {
  config_path = "~/.kube/config"
}
resource "kubernetes_pod" "nginx" {
  metadata {
    name = "terraform-example"
  }

  spec {
    container {
      image = "nginx:1.15.3"
      name  = "example"
    }
  }
}

# Create an service
resource "kubernetes_service" "nginx" {
  metadata {
    name = "terraform-example"
  }
  spec {
    selector = {
      run = kubernetes_pod.nginx.metadata.0.labels.run
    }
    port {
      port = 80
    }

    type = "LoadBalancer"
  }
}