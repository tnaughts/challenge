get '/projects' do
  @projects = Project.all
  p @projects
  erb :'projects/index'
end

get '/projects/:ppid' do
  @project = Project.find_by_ppid(params[:ppid])
  @stories = Story.where(project_id: Project.find_by_ppid(params[:ppid]).id)

  erb :'projects/show'
end
