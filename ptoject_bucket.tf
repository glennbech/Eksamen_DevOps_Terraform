resource "google_storage_bucket" "static-site" {
  project = "eksamen-devops"
  name = "eksamen_bucket"
  location = "EU"
}