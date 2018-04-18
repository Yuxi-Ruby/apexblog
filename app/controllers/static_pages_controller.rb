class StaticPagesController < ApplicationController
  def home
    @articles = Article.where(:private => false).take(9)
    @articles = Article.paginate(page: params[:page],per_page:9)
    @categories_count = Category.count
    @users_count = User.count

  end
end
