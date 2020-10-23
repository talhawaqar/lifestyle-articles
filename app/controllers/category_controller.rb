# frozen_string_literal: true

class CategoryController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
  end
end
