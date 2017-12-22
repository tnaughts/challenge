get '/stories' do
  protected!
  @stories = Story.all
  {stories: @stories}.to_json
end

get '/stories/:psid' do
  @story = Story.find_by_psid(params[:psid])
  {story: @story}.to_json
end

post '/stories/new' do
  protected!
  @story = Story.new(params[:story])
  if @story.save
    return {story: @story}.to_json
  end
  {errors: @story.save!}
end

put '/stories/:psid' do
  protected!
  @story = Story.find_by_psid(params[:psid])
  @story.update(params[:project])
  {story: @story}.to_json
end

delete '/stories/:psid' do
  protected!
  @story = Story.find_by_psid(params[:psid]).delete
  redirect '/stories'
end
