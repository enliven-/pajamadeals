class AddSoldToClassifieds < ActiveRecord::Migration
  def change
    add_column :classifieds, :sold, :boolean, default: false
    
    Classified.update_all sold: false
  end
end
