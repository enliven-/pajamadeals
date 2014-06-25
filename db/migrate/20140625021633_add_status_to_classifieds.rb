class AddStatusToClassifieds < ActiveRecord::Migration
  def change
  	add_column :classifieds, :active, :boolean, default: false
  	add_column :classifieds, :sold, :boolean, default: false
  	remove_column :classifieds, :list
  end
end
