before do
  response.headers['Access-Control-Allow-Origin'] = '*'
end

options '*' do
  response.headers["Allow"] = "GET, POST, OPTIONS, PUT"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Methods"] = "PUT"
  response.headers["Access-Control-Allow-Origin"] = "*"
  200
end

get '/api/vi/stories' do
  protected!
  @stories = Story.all
  {stories: @stories}.to_json
end

get '/api/vi/stories/:psid' do
  @story = Story.find_by_psid(params[:psid])
  {story: @story}.to_json
end

post '/api/vi/stories/new' do
  protected!
  @story = Story.new(params[:story])
  if @story.save
    return {story: @story}.to_json
  end
  {errors: @story.save!}
end

put '/api/vi/stories/:psid' do
  protected!
  @story = Story.find_by_psid(params[:psid])
  @story.update(params[:project])
  {story: @story}.to_json
end

delete '/api/vi/stories/:psid' do
  protected!
  @story = Story.find_by_psid(params[:psid]).delete
  redirect '/stories'
end
