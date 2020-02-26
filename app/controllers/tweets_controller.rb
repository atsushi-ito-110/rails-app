class TweetsController < ApplicationController

  def create
    tweet = current_user.tweets.new(tweet_params)
    unless tweet.save
      flash[:notice] = "ツイートになにか入力してください"
    end
    redirect_to home_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:user_id, :content)
  end
end