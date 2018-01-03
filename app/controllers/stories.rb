before do
  response.headers['Access-Control-Allow-Origin'] = '*'

  if request.request_method == 'POST' || request.request_method == 'PATCH'
      body_parameters = request.body.read
      begin
        data= params.merge!(JSON.parse(body_parameters))
        @can_parse = true
      rescue
        puts "LOG: cannot parse params"
        @can_parse = false
      end
  end
end

options '*' do
  response.headers["Allow"] = "GET, POST, OPTIONS, PUT, PATCH"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Methods"] = "PUT, PATCH"
  200
end

patch '/api/v1/stories/:psid' do
  protected!
  @story = Story.find_by_psid(params[:psid])
  @story.update(params['story'])
  {story: @story}.to_json
end

get '/api/v1/stories' do
  protected!
  @stories = Story.all
  {stories: @stories}.to_json
end

get '/api/v1/stories/:psid' do
  @story = Story.find_by_psid(params[:psid])
  {story: @story}.to_json
end

post '/api/v1/stories/new' do
  protected!
  @story = Story.new(params[:story])
  if @story.save
    return {story: @story}.to_json
  end
  {errors: @story.save!}
end

delete '/api/v1/stories/:psid' do
  protected!
  @story = Story.find_by_psid(params[:psid]).delete
  redirect '/stories'
end
