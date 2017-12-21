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
      t.integer :owned_by_id
      t.datetime :deadline
      t.datetime :accepted_at

      t.timestamps
    end
  end

  def down
    drop_table :stories
  end
end


{"kind"=>"story", "id"=>152497860, "created_at"=>"2017-11-02T00:38:34Z", "updated_at"=>"2017-11-02T00:38:34Z", "estimate"=>1, "story_type"=>"feature", "name"=>"Refuel speeder", "current_state"=>"unscheduled", "requested_by_id"=>2958479, "url"=>"https://www.pivotaltracker.com/story/show/152497860", "project_id"=>2088250, "owner_ids"=>[2958480], "labels"=>[{"id"=>19132325, "project_id"=>2088250, "kind"=>"label", "name"=>"2.2017.1", "created_at"=>"2017-09-14T03:58:32Z", "updated_at"=>"2017-09-14T03:58:32Z"}], "owned_by_id"=>2958480}
