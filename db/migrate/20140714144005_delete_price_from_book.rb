class DeletePriceFromBook < ActiveRecord::Migration
  def change
  	remove_column :books, :retail_price
  	add_column :classifieds, :retail_price, :string
  end
end
