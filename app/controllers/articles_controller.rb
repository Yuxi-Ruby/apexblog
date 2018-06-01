class ArticlesController < ApplicationController
  def index
    @articles = Article.where(:private => false).search(nil, nil).paginate(page: params[:page], per_page: 9)
    @categories = Category.all
  end

  def show
    @article = Article.find(params[:id])
    @articles = Article.order('id ASC')
    current_page = @articles.index{|article|article.id == params[:id].to_i}
    @navigation = {:current_page => current_page, :total_pages => @articles.count }
    @categories = Category.all
  end
end
