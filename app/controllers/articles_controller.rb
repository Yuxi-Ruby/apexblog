class ArticlesController < ApplicationController
  def index
    @articles = Article.where(:private => false)
    @categories = Category.all
  end

  def show
    @article = Article.find(params[:id])
    @categories = Category.all
  end
end
