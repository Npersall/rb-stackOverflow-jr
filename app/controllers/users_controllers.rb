get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.password == ""
    @errors = ["You didn't enter a password."]
    erb :'users/new'
  elsif @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["You didn't register properly."]
    erb :'users/new'
  end
end
