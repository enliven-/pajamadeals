class AddZipCodeToColleges < ActiveRecord::Migration
  def change
    add_column :colleges, :zip_code, :string
  end
end
