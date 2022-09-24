terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.27.0"
    }
  }
}

# Configura o Provider Google Cloud com o Projeto
provider "google" {

  project = "hack-aso-grupo-04"
  region  = "us-central1"
  zone    = "us-central1-b"
}

provider "google-beta" {
  project = "hack-aso-grupo-04"
  region  = "us-central1"
  zone    = "us-central1-b"
}

resource "google_artifact_registry_repository" "my-repo" {
  provider = google-beta

  location = "us-central1"
  repository_id = "hack-aso-grupo-04"
  description = "Imagens Docker"
  format = "DOCKER"
}

variable "database_password" {
type = string
}
variable "database_user" {
    type = string
}

resource "google_sql_database_instance" "instance" {
    name="spotmusic"
    region="us-central1"
    database_version="MYSQL_8_0"
    deletion_protection = false
    settings{
        tier="db-f1-micro"
    }
}
resource "google_sql_database" "database"{
    name="playlist"
    instance=google_sql_database_instance.instance.name
}
resource "google_sql_user" "database-user" {
    name = var.database_user
    instance = google_sql_database_instance.instance.name
    password = var.database_password
}