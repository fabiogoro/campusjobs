class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @companies = Company.all
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render new_category_path
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
