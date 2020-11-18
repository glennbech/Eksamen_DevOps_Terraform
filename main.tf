resource "google_cloud_run_service" "default" {
  name     = "eksamen-cloud-run-valid"
  location = "us-central1"
  project = "eksamen-devops"

  template {
    spec {
      containers {
        image = "gcr.io/eksamen-devops/eksamen-devops-docker-gcp@sha256:ab74e351642accf93b4a87f421271eb3fe77759c0a54291f10c6764d0dfddf20"
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