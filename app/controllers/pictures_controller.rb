class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :loggin_check, only: [:new, :edit, :show, :destroy, :index]

  def index
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.save
      CreateMailer.create_mail(@picture).deliver
      redirect_to pictures_path, notice: "Photoを作成しました"
    else
     render "new"
   end
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
     redirect_to pictures_path, notice: "Photoを編集しました！"
   else
     render 'edit'
   end

  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "Photoを削除しました"
  end

  def index
    @pictures = Picture.all
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  private

  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def loggin_check
    if session[:user_id] == nil
      redirect_to new_session_path, notice:"ログインしてください"
    end
  end

end
