terraform {
  backend "kubernetes" {
    secret_suffix = "state"
    config_path   = "~/.kube/config"
    namespace     = "autoapps"
    insecure      = true
  }
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.19.0"
    }
  }
}

provider "kubectl" {
  config_path    = "~/.kube/config"
  config_context = "autoapps"
  insecure       = true
}
