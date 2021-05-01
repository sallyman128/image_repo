class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def show
    set_image
  end

  def new
    @image = Image.new
  end

  def edit
    set_image
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user

    if @image.save
      redirect_to @image, confirm: "Are you sure?", notice: "Image was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    set_image

    if @image.update(image_params)
      redirect_to @image, notice: "Image was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_image
    @image.destroy
    redirect_to images_url, notice: "Image was successfully destroyed."
  end

  def select
    @images = Image.all
  end

  def many_destroy
    @images = []
    params[:images].each do |image_id|
      @images << Image.find(image_id)
    end
    
    @images.each do |image|
      image.destroy
    end

    redirect_to images_url, notice: "Images were successfully destroyed."
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:title, :caption, :picture)
    end
end
