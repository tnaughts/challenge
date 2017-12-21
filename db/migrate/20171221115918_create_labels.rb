class CreateLabels < ActiveRecord::Migration
  def up
    create_table :labels do |t|
      t.integer :plid
      t.string  :name
      t.integer :project_id
      t.integer :story_id
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def down
    drop_table :label
  end
end
