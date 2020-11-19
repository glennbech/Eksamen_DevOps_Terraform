resource "google_cloud_run_service" "default" {
  name     = "eksamen-cloud-run-valid"
  location = "us-central1"
  project = "eksamen-devops"

  template {
    spec {
      containers {
        image = "gcr.io/eksamen-devops/eksamen-devops-docker-gcp@sha256:0726925ad4dfcfe6175722a4468b9066d0a12b44ea4c15f636a65f5f02ce3fdf"
        env {
          name = "LOGZ_TOKEN"
          value = var.logz_token
        }
        env {
          name = "LOGZ_URL"
          value = var.logz_url
        }
        resources {
          limits = {
            memory = "512Mi"
          }
        }
      }
    }
  }


  traffic {
    percent = 100
    latest_revision = true
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