class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit]
  before_action :find_article, only: %i[show edit update destroy]

  def index
    @articles = Article.order(created_at: :desc)
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
      flash[:success] = 'Article Added'
      redirect_to root_path
    else
      flash[:error] = 'Article not Added'
      render 'new'
    end
  end

  def edit
    @categories = Category.all
    @selected_cat_ids = []
    @article.articles_categories.each { |c| @selected_cat_ids.push(c.category_id) }
  end

  def update
    @article.categories.destroy_all
    unless params[:article][:categories].nil?
      @category = Category.find(params[:article][:categories])
      @article.categories.push(@category)
    end
    if @article.update(article_params)
      flash[:success] = 'Article Updated'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show; end

  def destroy
    @article.destroy
    flash[:success] = 'Deleted Successfully'
    redirect_to root_path
  end

  def vote
    v = Vote.new(user_id: current_user.id, article_id: params[:id])
    if v.save
      flash[:success] = 'thums up'
    else
      flash[:error] = 'You already voted'
    end
    redirect_to article_path(params[:id])
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :article_image)
  end
end
