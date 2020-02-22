class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id]) #追加
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end
end
