get '/' do
  @posts = Post.all

  erb :index
end

get '/post/:id' do
  @post = Post.find params[:id]
  @user = @post.user

  erb :"post/show"
end

get '/user/:id' do
  @user = User.find params[:id]

  erb :"user/profile"
end

get '/user/:id/submissions' do
  @user = User.find params[:id]

  erb :"user/submissions"
end

get '/user/:id/comments' do
  @user = User.find params[:id]
  @comment = @user.comments

  erb :"user/comments"
end

get '/submit' do
  if current_user

    erb :"post/submit"

  else
    redirect '/login'
  end
end