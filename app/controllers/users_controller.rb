class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: params[:id]).order(id: :DESC).limit(10)
    @follow = Follow.where(user_id: current_user.id, follow_user_id: params[:id])
    @follows = Follow.where(user_id: params[:id])
    @followers = Follow.where(follow_user_id: params[:id])
  end

  def edit
    if params[:id].to_i == current_user.id
      @user = User.find(params[:id])
    else
      redirect_to user_path(params[:id], user_id: params[:id].to_i)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "保存しました"
      redirect_to user_path(params[:id], user_id: params[:id].to_i)
    else
      flash.now[:notice] = "保存に失敗しました"
      render 'users/edit'
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :introduction, :profile_image)
  end
end
