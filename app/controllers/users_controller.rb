class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    if params[:id].to_i == current_user.id
      @user = User.find(params[:id])
    else
      redirect_to user_path(params[:id])
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "保存しました"
      redirect_to user_path(params[:id])
    else
      flash[:notice] = "保存に失敗しました"
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :introduction, :profile_image)
  end
end
