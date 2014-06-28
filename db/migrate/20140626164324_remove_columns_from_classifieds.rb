class RemoveColumnsFromClassifieds < ActiveRecord::Migration
  def change
  	remove_column :classifieds, :title
  	remove_column :classifieds, :description
  	remove_column :classifieds, :image
  	remove_column :classifieds, :retail_price
  	remove_column :classifieds, :isbn
  	remove_column :classifieds, :edition
  	remove_column :classifieds, :publisher
  	remove_column :classifieds, :authors

  	add_column :classifieds, :comment, :text
  	add_column :classifieds, :book_id, :string
  end
end
