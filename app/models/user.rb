class User < ActiveRecord::Base
  has_many :assigned_stories
  has_many :stories, through: :assigned_stories
  has_many :labels
end
