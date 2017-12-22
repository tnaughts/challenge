class Story < ActiveRecord::Base
  belongs_to :project
  has_many :labels
  has_many :assigned_stories
  has_many :users, through: :assigned_stories
  belongs_to :requestor, class_name: 'User', foreign_key: :requested_by_id

  def owner_names
    self.users.pluck(:name).join(' | ')
  end
end
