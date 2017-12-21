class CreateProjects < ActiveRecord::Migration
  def up
    create_table :projects do |t|
      t.string  :name
      t.integer :ppid, unique: :true
      t.timestamps
    end
  end

  def down
    drop_table :projects
  end
end


# [{"id"=>2088250, "kind"=>"project", "name"=>"App", "version"=>1709, "iteration_length"=>1, "week_start_day"=>"Monday", "point_scale"=>"0,1,2,3", "point_scale_is_custom"=>false, "bugs_and_chores_are_estimatable"=>false, "automatic_planning"=>true, "enable_tasks"=>true, "time_zone"=>{"kind"=>"time_zone", "olson_name"=>"America/Los_Angeles", "offset"=>"-08:00"}, "velocity_averaged_over"=>3, "number_of_done_iterations_to_show"=>12, "has_google_domain"=>false, "enable_incoming_emails"=>true, "initial_velocity"=>10, "public"=>false, "atom_enabled"=>false, "project_type"=>"private", "start_time"=>"2017-07-31T07:00:00Z", "created_at"=>"2017-07-31T20:50:16Z", "updated_at"=>"2017-07-31T21:01:36Z", "account_id"=>1015154, "current_iteration_number"=>21, "enable_following"=>true}]
