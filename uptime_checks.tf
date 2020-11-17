provider "statuscake" {
  username = "joakimstoelenhotmailcom"
}

resource "statuscake_test" "google" {
  test_type = "HTTP"
  website_name = "DevOps Eksamen"
  website_url = "www.thisdoesnotexisthopefully123.com"
  check_rate = 10
  contact_group = ["195037"]
}