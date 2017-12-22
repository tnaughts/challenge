class CreateAssignedStories < ActiveRecord::Migration
  def up
    create_table :assigned_stories do |t|
      t.integer  :user_id
      t.integer :story_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def down
    drop_table :assigned_stories
  end
end
