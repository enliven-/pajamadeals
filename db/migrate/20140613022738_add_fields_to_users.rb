class AddFieldsToUsers < ActiveRecord::Migration
	def change
		add_column :users, :college_id, :integer
		add_column :users, :name, :string
		add_column :users, :avatar, :string
		add_column :users, :token, :string
		add_column :users, :active, :boolean, default: true
	end
end
