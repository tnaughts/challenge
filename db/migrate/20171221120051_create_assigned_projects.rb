class CreateAssignedProjects < ActiveRecord::Migration
  def up
    create_table :assigned_projects do |t|
      t.integer :project_id
      t.integer  :user_id
      t.integer :story_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def down
    drop_table :assigned_project
  end
end
