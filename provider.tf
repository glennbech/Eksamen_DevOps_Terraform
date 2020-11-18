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
//
//# Build code & release to the app
//resource "heroku_build" "example" {
//  app = "eksamen-heroku-app"
//  buildpacks = ["https://github.com/joakimstolen/Eksamen_DevOps_App.git"]
//
//  source = {
//    url = "https://github.com/joakimstolen/Eksamen_DevOps_App-master.zip"
//    version = "2.1.1"
//  }
//}