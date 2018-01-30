class AddPrivateAndSourceToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :private, :boolean
    add_column :articles, :source, :text
  end
end
