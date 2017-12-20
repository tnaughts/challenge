class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.integer :poid
      t.string  :name
      t.string  :initials
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def down
    drop_table :users
  end
end
