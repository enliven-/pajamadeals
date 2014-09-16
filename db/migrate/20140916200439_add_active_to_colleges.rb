class AddActiveToColleges < ActiveRecord::Migration
  def change
    add_column :colleges, :active, :boolean, default: true
    
    College.update_all active: true
  end
end
