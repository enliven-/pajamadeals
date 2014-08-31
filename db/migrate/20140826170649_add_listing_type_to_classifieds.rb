class AddListingTypeToClassifieds < ActiveRecord::Migration
  def change
    add_column :classifieds, :listing_type, :integer
  end
end
