class HomeController < ApplicationController
  def index
    featured_id = Vote.all.group(:article_id).count.map { |x, y| { id: x, count: y } }.max_by { |_k, v| v }
    featured_id = featured_id[:id] unless featured_id.nil?
    @feature_article = Article.find(featured_id) if featured_id.present?
    @categories = Category.order(priority: :desc)
  end
end
