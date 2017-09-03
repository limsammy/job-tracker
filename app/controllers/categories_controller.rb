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
end