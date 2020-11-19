provider "opsgenie" {
  api_key = "6c150a28-735a-4804-a9f9-8925f8875ab6"
  api_url = "api.eu.opsgenie.com"
}

resource "opsgenie_user" "user1" {
  full_name = "Test User"
  role = "User"
  username = "test@user.abc"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}

resource "opsgenie_user" "user2" {
  full_name = "Another User"
  role = "User"
  username = "another@user.abc"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}

resource "opsgenie_team" "testTeam" {
  name = "Team Test"

  member {
    id = opsgenie_user.user1.id
    role = "user"
  }

  member {
    id = opsgenie_user.user2.id
    role = "user"
  }
}

resource "opsgenie_schedule" "mainschedule" {
  name = "main_schedule"
  owner_team_id = opsgenie_team.testTeam.id
}

resource "opsgenie_schedule_rotation" "team1rotation" {
  schedule_id = opsgenie_schedule.mainschedule.id
  start_date = "2020-11-20T00:00:00Z"
  type = "hourly"
  participant {
    type = "user"
    id = opsgenie_user.user1.id
  }

  participant {
    type = "user"
    id = opsgenie_user.user2.id
  }
}