class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @categories = Category.all
  end

  def show
    @article = Article.find(params[:id])
    @categories = Category.all
  end
end
