class AddFieldsToUsers < ActiveRecord::Migration
	def change
		add_column :users, :college_id, :integer
		add_column :users, :first_name, :string
		add_column :users, :last_name, :string
		add_column :users, :avatar, :string
		add_column :users, :token, :string
		add_column :users, :active, :boolean, default: true
		add_column :users, :college_i_card_number, :string
		add_column :users, :college_i_card, :string
		add_column :users, :graduation_year, :string
	end
end
