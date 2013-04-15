get '/:user_name' do  
  @user = Twitteruser.find_or_create_by_user_name(params[:user_name])
  @tweets = @user.fetch_tweets.limit(10)

  erb :user
end



get '/' do

  if params[:user_name].nil?
    @user = nil
  else
    redirect to "/#{params[:user_name]}"
  end
  erb :index
end
