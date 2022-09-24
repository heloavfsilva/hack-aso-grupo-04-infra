terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.22.0"
    }
  }
}

# Configura o Provider Google Cloud com o Projeto
provider "google" {


  project = "lab-devops-cloud-343686"
  region  = "us-east1"
  zone    = "us-east1-c"
}