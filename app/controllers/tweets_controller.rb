class TweetsController < ApplicationController
  before_action :authenticate_user!
  def create
    tweet = current_user.tweets.new(tweet_params)
    tweets = Tweet.all
    unless params[:content].blank?
      tweets = tweets.where("content LIKE ?", "%#{params[:content]}%")
    end
    tweets = tweets.order(id: :DESC).limit(20)
    if tweet.save
      results = {
        flash: {
          notice: "ツイートしました",
          is_success: true,
        },
        tweets: tweets,
        tweet: Tweet.new,
      }
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
    @tweets = @tweets.order(id: :DESC).limit(20)
    @tweet = @user.tweets.new()
    render 'home/index'
  end

  def index_part
    logger.info(params.inspect)
    tweets = Tweet.all
    unless params[:content].blank?
      tweets = tweets.where("content LIKE ?", "%#{params[:content]}%")
    end
    unless params[:user_id].blank?
      tweets = tweets.where("user_id = ?", params[:user_id])
    end
    tweets = tweets.order(id: :DESC).limit(20).offset(params[:offset])
    render 'home/index', locals: {
      results: {
        tweets: tweets
      }
    }
  end

  private
  def tweet_params
    params.require(:tweet).permit(:user_id, :content, tweet_images_images: [])
  end
end