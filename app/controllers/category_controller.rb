class CategoryController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.desc.includes(:user)
  end
end
