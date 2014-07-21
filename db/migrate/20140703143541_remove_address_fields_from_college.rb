class RemoveAddressFieldsFromCollege < ActiveRecord::Migration
  def change
    remove_column :colleges, :address, :string
    remove_column :colleges, :state, :string
    remove_column :colleges, :country, :string
  end
end
