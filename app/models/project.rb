class Project < ActiveRecord::Base
  has_many :stories
  has_many :labels
  has_many :users, through: :assigned_projects
end