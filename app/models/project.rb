class Project < ActiveRecord::Base
  has_many :stories
  has_many :labels
end
