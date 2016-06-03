class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :author
      t.integer :article

      t.timestamps
    end
  end
end
