# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    featured_id = Vote.all.group(:article_id).count.map { |x, y| { id: x, count: y } }.max_by { |_k, v| v }[:id]
    @feature_article = Article.find(featured_id)
    @categories = Category.all
  end
end
