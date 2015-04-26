class IdeasController < ApplicationController

  def new
    @idea = current_user.ideas.new
    @categories = Category.all
  end

  def index
    @ideas = current_user.ideas
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    categories = params[:idea][:category_ids].reject(&:empty?)
    if @idea.save
      flash[:notice] = "Idea created!"
      categories.each { |category| @idea.categories << Category.find(category) }
      redirect_to idea_path(@idea)
    else
      flash[:error] = "Invalid entry"
      render :new
    end
  end

  def show
    @idea = current_user.ideas.find(params[:id])
  end

  def edit
      @idea = current_user.ideas.find(params[:id])
      @categories = Category.all
    end

    def update
      @idea = current_user.ideas.find(params[:id])
      categories = params[:idea][:category_ids].reject(&:empty?)
      if @idea.update(idea_params)
        @idea.categories.destroy_all
        categories.each { |category| @idea.categories << Category.find(category) }
        redirect_to idea_path(@idea)
      else
        render :edit
      end
    end

    def destroy
      @idea = current_user.ideas.find(params[:id])
      @idea.destroy
      redirect_to ideas_path
    end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end

end
