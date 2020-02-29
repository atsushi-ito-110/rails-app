class HomeController < ApplicationController
  def index
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @tweets = Tweet.all.order(id: "DESC")
    @tweet = Tweet.new
  end
end