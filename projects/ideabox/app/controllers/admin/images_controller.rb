class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Image Created!"
      redirect_to admin_images_path
    else
      flash[:error] = @image.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "image has been updated!"
      redirect_to admin_images_path
    else
      flash[:error] = @image.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to admin_images_path
  end


  private

  def image_params
    params.require(:image).permit(:url, :description)
  end


end
