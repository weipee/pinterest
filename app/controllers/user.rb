enable :sessions

helpers do
  def current_user
    if session[:user_id]
      User.find session[:user_id]
    else
      nil
    end
  end

  def logged_in?
    if current_user
      true
    else
      false
    end
  end
end


get '/login' do

  erb :"user/login"
end

post '/login' do
  @user = User.authenticate(params[:username_or_email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    redirect '/error'
  end
end

get '/error' do
  erb :"user/error"
end

post '/register' do
  User.create(params[:user])

  redirect '/home'
end

get '/home' do
  if session[:user]
    @user = User.find session[:user_id]
    @posts = Post.all
    erb :home
  else
    redirect '/access_denied'
  end
end

get '/logout' do
  session[:user] = nil
  redirect '/'
end

get '/access_denied' do
  erb :access_denied
end