get '/login' do
  erb :'sessions/login'
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user && User.authenticate(params[:username], params[:password])
    session[:id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["Your password or username is incorrect. Please try again."]
    erb :'sessions/login'
  end
end

# Change this to delete method, make hidden method on form
post '/logout' do
  session.delete(:id)
  redirect '/'
end
