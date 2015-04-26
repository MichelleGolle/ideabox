class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category Created!"
      redirect_to admin_categories_path
    else
      flash[:error] = @category.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category has been updated!"
      redirect_to admin_categories_path
    else
      flash[:error] = @category.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end


end
