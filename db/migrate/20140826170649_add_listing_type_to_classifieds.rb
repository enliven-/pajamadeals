class AddListingTypeToClassifieds < ActiveRecord::Migration
  def change
    add_column :classifieds, :listing_type, :integer
    
    Classified.update_all listing_type: 1
  end
end
