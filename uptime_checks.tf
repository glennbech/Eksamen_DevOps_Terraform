provider "statuscake" {
  username = "joakimstoelenhotmailcom"
}

resource "statuscake_test" "google" {
  test_type = "HTTP"
  website_name = "DevOps Eksamen"
  website_url = google_cloud_run_service.default.status[0].url
  check_rate = 300
  contact_group = ["193689"]

}