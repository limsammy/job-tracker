class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    category = Category.create(category_params)
    if category.save
      redirect_to category_path(category)
    else
      flash[:danger] = "That category has already been created!"
      redirect_to new_category_path(category)
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)
    if category.save
      flash[:success] = "Category sucessfully updated!"
      redirect_to category_path(category)
    else
      redirect_to edit_category_path(category)
    end
  end

  def destroy
    category = Category.find(params[:id])
    flash[:success] = "Category #{category.title} was deleted!"
    category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
