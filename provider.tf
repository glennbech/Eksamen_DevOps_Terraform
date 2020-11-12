terraform {
  backend "gcs" {
    bucket = "eksamen_bucket2"
    prefix = "terraformstate"
    credentials = "eksamen-devops-d3394a9d2905.json"
  }
}

provider "google-beta" {
  credentials = file("eksamen-devops-d3394a9d2905.json")
  project     = "eksamen-devops"
  version = "~> 3.0.0-beta.1"
}
