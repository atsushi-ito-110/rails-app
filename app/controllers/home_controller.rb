class HomeController < ApplicationController
  def index
    @user = User.find(current_user.id) if user_signed_in?
    @tweets = Tweet.search_limited
    @tweet = Tweet.new
    @tweet.tweet_images.build
  end
end
