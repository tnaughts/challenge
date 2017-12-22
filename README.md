## The Stack

- Language: Ruby
- Framework: [sinatra](http://www.sinatrarb.com/)
- PSQL

## To Run:
- `ruby rtchallenge.rb`

## Requirements:
- `ENV['USER']='user'` user to login with
- `ENV['USER_PW']='password1'` password to login with
- `ENV['PT_TOKEN']='d133a1b130e414e794958136fd6e8a76'`
- `ENV['PT_PROJECTS']='2088251, 2088250'` pivotal projects
- `ENV['RELEASE_LABEL']=''` Name of current release tag by PM.

## Additional Info:

### [Pivotal login](https://www.pivotaltracker.com/signin):
- user: `nate+test1@reviewtrackers.com`
- pw: `Password1!`


## Updates

### moved to restful Sinatra structure
- changed Owners to user (planning to set up relations)
- moved helpers to separate helper folder

### set up Tables
- added a User, Story, Project, and AssignedProject table
- set up relations

### seeding Services
- unsure of how the app will be used, either as the main input for all stories or if it will continue to need to be reseeded

### Created restful routing on controllers
- began setup of basic front end

### future
- implement serialization of resources so that any type of front end tech can be utilized
