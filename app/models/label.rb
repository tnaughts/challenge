class Label < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :project
  belongs_to :story
  belongs_to :user
end
