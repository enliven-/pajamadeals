class AddActiveOnCategories < ActiveRecord::Migration
  def change
    add_column :categories, :active, :boolean, default: true
    
    Category.update_all active: true
  end
end
