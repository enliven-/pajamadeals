class RemoveSuggestedPriceFromClassified < ActiveRecord::Migration
  def change
    remove_column :classifieds, :suggested_price, :string
    remove_column :classifieds, :contact_preference, :string
  end
end
