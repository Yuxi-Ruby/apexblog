class StaticPagesController < ApplicationController
  def home
    @articles = Article.all.sample(3)
    @categories_count = Category.count
    @users_count = User.count
  end
end
