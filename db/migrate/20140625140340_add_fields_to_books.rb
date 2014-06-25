class AddFieldsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :department, :string
    add_column :books, :semester, :string
  end
end
