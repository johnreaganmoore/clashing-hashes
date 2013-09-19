module Twitter
  class Tweet

    attr_accessor :user, :tweet

    def initialize(user, tweet)
      @user = user
      @tweet = tweet
    end
  end
end