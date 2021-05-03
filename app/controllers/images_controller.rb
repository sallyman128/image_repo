class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def show
    set_image
    @user = @image.user
    current_user
  end

  def new
    render_login_if_not_logged_in
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user

    if @image.save
      redirect_to user_path(@image.user), confirm: "Are you sure?", notice: "Image was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    set_image
    @image.destroy
    redirect_to images_url, notice: "Image was successfully destroyed."
  end

  def destroy_many
    params[:images].each do |image_id|
      image = Image.find(image_id)
      image.destroy
    end

    user = User.find(session[:user_id])
    redirect_to user_path(user), notice: "Images were successfully destroyed."
  end


  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:picture)
    end
end
