class RemoveLocationFromColleges < ActiveRecord::Migration
  def change
    remove_column :colleges, :location, :string
  end
end
