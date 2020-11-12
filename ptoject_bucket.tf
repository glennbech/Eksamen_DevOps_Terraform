resource "google_storage_bucket" "static-site" {
  project = "eksamen-devops"
  name = "eksamen_bucket2"
  location = "EU"
}