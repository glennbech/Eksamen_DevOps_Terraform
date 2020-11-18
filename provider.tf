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



provider "heroku" {
  email   = "joakimstoelen@hotmail.com"
  api_key = "f882b367-6e78-49dd-ab69-c61573560edd"
}

# Create a new application
resource "heroku_app" "default" {
  name = "eksamen-heroku-app"
  region = "us"
}