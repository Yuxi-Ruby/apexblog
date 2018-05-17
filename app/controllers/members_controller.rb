class MembersController < ApplicationController
  def index
    @articles = Article.where(:private => false).search(params[:search]).paginate(page: params[:page], per_page: 6).take(6)
    @categories = Category.all
  end
end
