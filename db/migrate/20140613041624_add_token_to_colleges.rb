class AddTokenToColleges < ActiveRecord::Migration
  def change
    add_column :colleges, :token, :string
  end
end
