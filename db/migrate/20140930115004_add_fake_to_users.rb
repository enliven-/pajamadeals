class AddFakeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fake, :boolean
  end
end
