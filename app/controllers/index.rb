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

get '/api/vi' do
  protected!
  redirect 'api/vi/projects'
end
