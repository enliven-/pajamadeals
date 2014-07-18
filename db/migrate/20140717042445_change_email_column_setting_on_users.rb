class ChangeEmailColumnSettingOnUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email
    add_column :users, :email, :string, defauls: ''
  end
end
