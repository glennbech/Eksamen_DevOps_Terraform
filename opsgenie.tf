provider "opsgenie" {
  api_url = "api.opsgenie.com"
}

resource "opsgenie_user" "userEksamenOne" {
  full_name = "Test User"
  role = "User"
  username = "test@eksamenuser.com"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}

resource "opsgenie_user" "userEksamenTwo" {
  full_name = "Another User"
  role = "User"
  username = "anothertest@eksamenuser.com"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}

resource "opsgenie_team" "testTeam" {
  name = "Team Test"

  member {
    id = opsgenie_user.userEksamenOne.id
    role = "user"
  }

  member {
    id = opsgenie_user.userEksamenTwo.id
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
    id = opsgenie_user.userEksamenOne.id
  }

  participant {
    type = "user"
    id = opsgenie_user.userEksamenTwo.id
  }
}