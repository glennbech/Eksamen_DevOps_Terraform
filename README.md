
[![Build Status](https://travis-ci.com/joakimstolen/Eksamen_DevOps_Terraform.svg?token=2oGxk1NA54S8kvu1Qqs9&branch=master)](https://travis-ci.com/joakimstolen/Eksamen_DevOps_Terraform)
# Infrastructure for PGR301 Exam

## About
Eksamensoppgave for PGR301 DevOps i skyen på Høyskolen Kristiania. Dette er Infrastruktur-repositoryet. Applikasjonen til eksamen kan ses her: https://github.com/joakimstolen/Eksamen_DevOps_App

##Setting up Infrastructure
* Lag et Google Cloud Platform prosjekt
* Lag en Google Cloud Storage Bucket i prosjektet
* Sørg for at Container Registry, Cloud Storage og Cloud Run er enabled
* Lag en ny service account i prosjektet
* Legg til følgende roller til service account; Google Stoeage Admin, Container Registry Service Agent, Cloud Run Service Agent
* Last ned en nøkkelfil for service accounten og lagre denne i rotkatalogen til infrastruktur repository
* Krypter nøkkelfilen ved å kjøre ` travis encrypt-file "dittfilnavn.json" --add`
## Setting Keys & Secrets
* ` travis encrypt-file "dittfilnavn.json" --add`
* `travis encrypt STATUSCAKE_USERNAME=<your_username> --add`
* `travis encrypt STATUSCAKE_APIKEY=<your_key> --add`
* `travis encrypt OPSGENIE_API_KEY=<your_key> --add`
* `travis encrypt TF_VAR_logz_url=<your_url> --add`
* `travis encrypt TF_VAR_logz_token=<your_key> --add`
##Status Cake
Infrastrukturen bruker Status Cake for å overvåke applikasjonen. Sier ifra til varselgruppe om applikasjonen går opp eller ned (endrer status)
##OpsGenie (Oppgave 6)
Valgte OpsGenie til oppgave 6. OpsGenie er begrenset i bruken (gratis-versjon). Men det den hovedsakelig gjør i denne infrastrukturen er å sette opp grupper med brukere og lage timeplan for når hvilke brukere skal ha tilsyn for applikasjonen den er satt opp til. I oppgaven har jeg kun satt opp eksempelbrukere og eksempelgrupper. Infrastrukturen lager grupper med tilsynsbrukere og lager timeplan for når hvilke brukere skal ha tilsyn til applikasjonen.