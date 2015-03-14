get '/' do
  @posts = Post.order(id: :asc)
  @user = current_user if logged_in?

  erb :index
end

get '/post/:id' do
  @post = Post.find params[:id]
  @user = @post.user

  erb :"post/show"
end

post '/post/:id/vote' do
  if logged_in?
    @post = Post.find params[:id]
    @user = @post.user
    @user_voting = current_user
    PostVote.create(post: @post, user: @user_voting)
  erb :"post/show"
  else
    redirect '/access_denied'
  end
end

get '/user/:id' do
  @user = User.find params[:id]

  erb :"user/profile"
end

get '/user/:id/submissions' do
  @user = User.find params[:id]

  erb :"user/submissions"
end

get '/comment/:id' do
  @comment = Comment.find params[:id]
  @comuser = @comment.user

  erb :"post/show"
end

get '/usr/:id/comments' do
  @user = User.find params[:id]
  @comment = @user.comments
  erb :"user/comments"
end

get '/submit' do
  if current_users
    erb :"post/submit"

  else
    redirect '/login'
  end
end