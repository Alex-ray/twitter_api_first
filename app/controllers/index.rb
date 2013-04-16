get '/:user_name' do
  @user = Twitteruser.find_or_create_by_user_name(params[:user_name])
  if @user.tweets_stale?
    erb :loading
  else
    @tweets = @user.tweets
    erb :tweets
  end
end

get '/latest/:user_name' do
  @user = Twitteruser.find_by_user_name(params[:user_name])
  @tweets = @user.fetch_tweets.limit(10)
  erb :tweets
end

get '/' do
  if params[:user_name]
    redirect "/#{params[:user_name]}"
  else
    erb :index
  end
end
