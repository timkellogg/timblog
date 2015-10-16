class AddPictureToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :picture, :string
    remove_column :articles, :image_url
  end
end
