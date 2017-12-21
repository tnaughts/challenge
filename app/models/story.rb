class Story < ActiveRecord::Base
  belongs_to :project
  has_many :labels
  has_many :assigned_projects
  has_many :users, through: :assigned_projects
end
