require './lib/services/projects/configuration'
require './lib/services/users/configuration'
require './lib/services/stories/configuration'

Services::Projects::Configuration.process
Services::Users::Configuration.process
Services::Stories::Configuration.process
