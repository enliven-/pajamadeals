class AddFieldsToPick < ActiveRecord::Migration
  def change
    add_column :picks, :name, :string
    add_column :picks, :phone, :string
    add_column :picks, :college_id, :string
    add_column :picks, :college, :string
    add_column :picks, :email, :string
  end
end
