class CreateStories < ActiveRecord::Migration
  def up
    create_table :stories do |t|
      t.string  :name
      t.integer :psid
      t.string  :story_type
      t.integer :points
      t.string :status
      t.integer :requested_by_id
      t.string :url
      t.integer :project_id
      t.datetime :deadline
      t.datetime :accepted_at

      t.timestamps
    end
  end

  def down
    drop_table :stories
  end
end
