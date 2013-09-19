require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/twitter.rb'

module Twitter


  def self.compare(h1, h2)
    if h1.count > h2.count 
      @winner = h1.tag
      @loser = h2.tag
    else
      @winner = h2.tag
      @loser = h1.tag
    end
  end

  class Hashtag

    attr_accessor :count, :tag

    def initialize(tag)
      @tag = tag
      @count = 0
    end

  end

  class Tweet

    attr_accessor :user, :tweet

    def initialize(user, tweet)
      @user = user
      @tweet = tweet
    end
  end
end



get '/' do
  # @name = 'John Reagan'
  # @show_description = false

  erb :index
end



post '/twitter' do

#___________________HASHTAGS_______________________________________________

  @tag1 = params[:hash1]
  @tag2 = params[:hash2]

  hash1 = Twitter::Hashtag.new(@tag1)
  hash2 = Twitter::Hashtag.new(@tag2)

  # hash1 = Twitter::Hashtag.new(params[:hash1])
  # hash2 = Twitter::Hashtag.new(params[:hash2])

  @hashtags = []

  new_hashtag = Twitter::Hashtag.new(params[:tag])

  @hashtags << new_hashtag

  hash1.count = 5
  hash2.count = 1

  @winner = hash1
  @loser = hash2

  Twitter.compare(hash1, hash2)



#_____________________TWEETS_______________________________________________

  example = Twitter::Tweet.new('John Reagan', 'Some Tweet')
  example2 = Twitter::Tweet.new('Andrew', 'Somthing Else')
  example3 = Twitter::Tweet.new('Rando', 'Random')

  @tweets = [example, example2, example3]

  new_tweet = Twitter::Tweet.new(params[:user], params[:content])

  @tweets.push(new_tweet)


# #loop through array of tweet content create an array of arrays of words in each tweet
#   tweet_words = @contents.collect do |string|
#     string.split(' ')
#   end



# #loop through array of arrays of words.
#   tweet_words.each do |words|
# #for each array check to see if any words in the array are the same as any hashtags

#     if words.any? {|word| hashtags.include?(word)}
#       words.each do |word|
#         if @@hashtags.include?(word)

  erb :twitter
end

# post_tweet do

#   tweets = [1,2,3]

#   tweets.each do |i|

#     post "/twitter/#{tweets[i]}" do

#       i.user = @tweeter
#       i.tweet = @tweet

#     end
#   end
# end

