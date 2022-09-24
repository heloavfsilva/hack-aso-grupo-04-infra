resource "google_app_engine_application" "app" {
  project     = "hack-aso-grupo-04"
  location_id = "us-central"
}

resource "google_artifact_registry_repository" "my-repo" {
  location = "us-central1"
  repository_id = "hack-aso-grupo-04"
  description = "Imagens Docker"
  format = "DOCKER"
}