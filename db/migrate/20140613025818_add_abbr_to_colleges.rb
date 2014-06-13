class AddAbbrToColleges < ActiveRecord::Migration
  def change
    add_column :colleges, :abbr, :string
  end
end
