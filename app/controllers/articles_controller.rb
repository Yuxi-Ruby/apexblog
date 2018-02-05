class ArticlesController < ApplicationController
  def index
    @articles = if params[:term]
      Article.search_anywhere(params[:term])
    else
      Article.all
    end
    
    @categories = Category.all
  end

  def show
    @article = Article.find(params[:id])
    @categories = Category.all
  end

  def article_params
    params.require(:task).permit(:title, :complete, :due_date, :term)
  end
end
