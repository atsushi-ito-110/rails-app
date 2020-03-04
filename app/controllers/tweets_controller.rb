class TweetsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = current_user
    @tweet = @user.tweets.new(tweet_params)
    if @tweet.save
      flash[:notice] = "ツイートしました"
      flash[:is_success] = true
      redirect_to home_path
    else
      @tweets = Tweet.all.order(id: "DESC")
      flash.now[:notice] = "ツイートになにか入力してください"
      flash[:is_warning] = true
      render 'home/index'
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:user_id, :content)
  end
end