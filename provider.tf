terraform {
  backend "gcs" {
    bucket = "eksamen_bucket"
    prefix = "terraformstate"
    credentials = "eksamen-devops-f7bc3c2f300a.json"
  }
}

provider "google-beta" {
  credentials = file("eksamen-devops-f7bc3c2f300a.json")
  project     = "eksamen-devops"
  version = "~> 3.0.0-beta.1"
}


