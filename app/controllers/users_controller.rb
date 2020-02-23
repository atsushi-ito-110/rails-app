class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # 追記
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "保存しました"
      redirect_to user_path(@user)
    else
    end
  end

  # 追記: ストロングパラメーターに追加したカラムを記載
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
