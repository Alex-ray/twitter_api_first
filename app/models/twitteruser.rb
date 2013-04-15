class Twitteruser < ActiveRecord::Base
  has_many :tweets


  def fetch_tweets

    if self.tweets_stale?
      self.update_attributes(:last_saved => DateTime.now)
      self.tweets.delete_all 

      tweets = Twitter.user_timeline(self.user_name)
      tweets.each do |tweet|
        self.tweets << Tweet.create(text: tweet.text, 
                                    created_at: tweet.created_at)
      end
    end
    
    return self.tweets
  end

  def tweets_stale?
    return true if self.last_saved == nil
    (Time.now - self.last_saved) > (3*60)
  end
end
