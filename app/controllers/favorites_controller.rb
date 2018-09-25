class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_url, notice: "#{favorite.picture.user.name}さんのPictureをお気に入りしました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_url, notice: "#{favorite.picture.user.name}さんのPictureをお気に入り解除しました"
  end

  def show
    @user = User.find(params[:id])
  end
end
