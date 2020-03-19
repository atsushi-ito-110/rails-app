class TweetsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = current_user
    @tweet = @user.tweets.new(tweet_params)
    if @tweet.save
      results = {
        flash: {
          notice: "ツイートしました",
          is_success: true,
        },
        tweets: Tweet.all.order(id: "DESC"),
        tweet: Tweet.new,
      }
      logger.info(results[:tweets].length)
      render 'home/create', locals: { results: results }
    else
      results = {
        flash: {
          notice: "ツイートになにか入力してください",
          is_warning: true,
        },
      }
      render 'home/create', locals: { results: results }
    end
  end

  def index
    if user_signed_in?
      @user = current_user
    end
    @tweets = Tweet.all
    unless params[:content].blank?
      @tweets = @tweets.where("content LIKE ?", "%#{params[:content]}%")
    end
    @tweets = @tweets.order(id: :DESC)
    @tweet = @user.tweets.new()
    @search = Tweet.new(content: params[:content])
    render 'home/index'
  end

  private
  def tweet_params
    params.require(:tweet).permit(:user_id, :content)
  end
end