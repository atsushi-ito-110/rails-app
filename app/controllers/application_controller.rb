class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if user_signed_in?
      @search = Tweet.new
    end
    home_path
  end
end
