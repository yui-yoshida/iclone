class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "登録しました。ログインしてください。"
      redirect_to new_session_path
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def fav_pictures
    @user = User.find(params[:id])
    @favorites_pictures = @user.favorites
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
