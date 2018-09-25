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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update(user_params)
        flash[:notice] = "ユーザー情報を編集しました"
        render "show"
      else
        flash[:notice] = "ユーザー情報の編集に失敗しました"
        render "edit"
      end
    end
  end

  def fav_pictures
    @user = User.find(params[:id])
    @favorites_pictures = @user.favorite_pictures
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
