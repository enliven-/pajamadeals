class AddLocationToColleges < ActiveRecord::Migration
  def change
    add_column :colleges, :latitude, :string
    add_column :colleges, :longitude, :string
  end
end
