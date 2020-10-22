class ArticleController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
