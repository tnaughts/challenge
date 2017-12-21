class User < ActiveRecord::Base
  has_many :assigned_projects
  has_many :projects, through: :assigned_projects
  has_many :labels
end
