resource "google_cloud_run_service" "default" {
  name     = "eksamen-cloud-run-valid"
  location = "us-central1"
  project = "eksamen-devops"

  template {
    spec {
      containers {
        image = "gcr.io/eksamen-devops/eksamen-devops-docker-gcp"
      }
    }
  }
}



data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}