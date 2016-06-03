class StaticPagesController < ApplicationController
  def home
    @articles = Article.all.sample(3)
    @categories = Category.all
    @user = User.all
  end

end
