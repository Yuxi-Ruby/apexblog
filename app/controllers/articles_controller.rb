class ArticlesController < ApplicationController
  def index
    @articles = Article.search(params[:term])
    @categories = Category.all
  end

  def show
    @article = Article.find(params[:id])
    @categories = Category.all
  end
end
