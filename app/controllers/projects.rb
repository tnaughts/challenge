get '/projects' do
  @projects = Project.all
  {projects: @projects}.to_json
end

post '/projects/new' do
  @project = Project.new(params[:project])
  if @project.save
    return {project: @project}.to_json
  end
  {errors: @project.save!}
end

put '/projects/:psid' do
  protected!
  @project = Story.find_by_psid(params[:psid])
  @project.update(params[:project])
  {project: @project}.to_json
end

get '/projects/:ppid' do
  @project = Project.find_by_ppid(params[:ppid])
  @stories = Story.where(project_id: Project.find_by_ppid(params[:ppid]).id)
  {project: @project, stories: @stories}.to_json
end
