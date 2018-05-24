class StaticPagesController < ApplicationController
  def home
    @articles = Article.where(:private => false).search(nil, nil).paginate(page: params[:page], per_page: 9)
    @categories_count = Category.count
    @users_count = User.count
    @categories = Category.all
  end

  def find_articles
    search = params[:search]
    tag = params[:tag]
    @articles = Article.where(:private => false).search(search, tag).paginate(page: params[:page], per_page: 9)
  end
end
