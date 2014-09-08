class RemoveDeviseFieldsFromUser < ActiveRecord::Migration
  def change
    remove_index :users, :reset_password_token
    remove_index :users, :email

    remove_column :users, :encrypted_password
    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_sent_at
    remove_column :users, :remember_created_at
    remove_column :users, :guest, :boolean
    
    add_index :users, :mobile, unique: true
    add_index :users, :uid, unique: true
  end
end
