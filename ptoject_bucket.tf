resource "google_storage_bucket" "static-site" {
  project = var.project_name
  name = "eksamen_bucket2"
  location = "EU"
}