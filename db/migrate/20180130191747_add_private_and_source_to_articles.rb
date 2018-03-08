class AddPrivateAndSourceToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :private, :boolean, default: false
    add_column :articles, :source, :text
  end
end
