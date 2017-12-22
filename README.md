## The Stack

- Language: Ruby
- Framework: [sinatra](http://www.sinatrarb.com/)
- PSQL

## To Run:
- `shotgun`

## Requirements:
- PIVOTAL_URL="https://www.pivotaltracker.com/services/v5"
- PT_TOKEN='d133a1b130e414e794958136fd6e8a76'
- PT_PROJECTS='2088251, 2088250'
- RELEASE_LABEL='2.2017.1'
- RT_USER='user'
- RT_USER_PW='password1'

## Additional Info:

### [Pivotal login](https://www.pivotaltracker.com/signin):
- user: `nate+test1@reviewtrackers.com`
- pw: `Password1!`


## Updates

### moved to restful Sinatra structure
- changed Owners to user (planning to set up relations)
- moved helpers to separate helper folder

### set up Tables
- added a User, Story, Project, and AssignedStory table
- set up relations

### seeding Services
- unsure of how the app will be used, either as the main input for all stories or if it will continue to need to be reseeded. Pulled out all fetching from pivotal into separate services that can either be taken away or used as needed.

### Created restful routing on controllers
- began setup of basic front end

### Routes
- implement serialization of resources so that any type of front end tech can be utilized

### CORS
- added ability to restrict routes and request types


Notes: switched env file
- PIVOTAL_URL="https://www.pivotaltracker.com/services/v5"
- PT_TOKEN='d133a1b130e414e794958136fd6e8a76'
- PT_PROJECTS='2088251, 2088250'
- RELEASE_LABEL='2.2017.1'
- RT_USER='user'
- RT_USER_PW='password1'
