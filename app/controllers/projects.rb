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

get '/api/vi/projects' do
  protected!
  @projects = Project.all
  {projects: @projects}.to_json
end

post '/api/vi/projects/new' do
  protected!
  @project = Project.new(params[:project])
  if @project.save
    return {project: @project}.to_json
  end
  {errors: @project.save!}
end

put '/api/vi/projects/:psid' do
  protected!
  @project = Story.find_by_psid(params[:psid])
  @project.update(params[:project])
  {project: @project}.to_json
end

get '/api/vi/projects/:ppid' do
  protected!
  @project = Project.find_by_ppid(params[:ppid])
  @stories = Story.where(project_id: Project.find_by_ppid(params[:ppid]).id)
  {project: @project, stories: @stories}.to_json
end
