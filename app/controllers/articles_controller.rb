class ArticlesController < ApplicationController
  def index
    @articles = Article.where(:private => false).search(params[:search]).paginate(page: params[:page], per_page: 9)
    @categories = Category.all
  end

  def show
    @article = Article.find(params[:id])
    @categories = Category.all
  end
end
