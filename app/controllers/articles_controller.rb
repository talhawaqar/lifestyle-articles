class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params.merge(author_id: current_user.id))
    unless params[:article][:categories].nil?
      @category = Category.find(params[:article][:categories])
      @article.categories.push(@category)
    end
    if @article.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :article_image)
  end
end
