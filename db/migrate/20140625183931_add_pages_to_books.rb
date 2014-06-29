class AddPagesToBooks < ActiveRecord::Migration
  def change
    add_column :books, :pages, :string
  end
end
