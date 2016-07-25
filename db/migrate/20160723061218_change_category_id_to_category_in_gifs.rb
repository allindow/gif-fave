class ChangeCategoryIdToCategoryInGifs < ActiveRecord::Migration
  def change
    remove_column :gifs, :category_id
  end
end
