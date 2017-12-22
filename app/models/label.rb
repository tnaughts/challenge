class Label < ActiveRecord::Base
  belongs_to :project
  belongs_to :story
  belongs_to :user
end
