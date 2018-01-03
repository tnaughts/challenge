require 'minitest/autorun'
require './lib/services/stories/configuration'


class TestConfiguration < Minitest::Test


  def test_that_kitty_can_eat
    assert_equal "OHAI!", "OHAI!"
  end

  def test_service_config
    story = [{"kind"=>"story", "id"=>152499484, "created_at"=>"2017-11-02T03:12:45Z", "updated_at"=>"2017-11-14T00:18:14Z", "accepted_at"=>"2017-11-02T03:47:05Z", "estimate"=>2, "story_type"=>"feature", "name"=>"Feed Sarla", "current_state"=>"accepted", "requested_by_id"=>2958479, "url"=>"https://www.pivotaltracker.com/story/show/152499484", "project_id"=>2088250, "owner_ids"=>[2958480, 2958479], "labels"=>[{"id"=>19132325, "project_id"=>2088250, "kind"=>"label", "name"=>"2.2017.1", "created_at"=>"2017-09-14T03:58:32Z", "updated_at"=>"2017-09-14T03:58:32Z"}], "owned_by_id"=>2958480}]

    Story.first.name.must_equal(story[0]["name"])  
    assert_nil(Services::Stories::Configuration.process)

  end

end
