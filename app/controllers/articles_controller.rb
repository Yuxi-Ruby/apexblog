class ArticlesController < ApplicationController
  def index
    @articles = Article.where(:private => false).search(params[:term]).paginate(page: params[:page], per_page: 3)
    @categories = Category.all
  end

  def show
    @article = Article.find(params[:id])
    @categories = Category.all
  end
end
