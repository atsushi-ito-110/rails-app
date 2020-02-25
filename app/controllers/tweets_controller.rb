class TweetsController < ApplicationController

  def create
    tweet = current_user.tweets.new(tweet_params)
    tweet.save
    redirect_to home_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:user_id, :content)
  end
end