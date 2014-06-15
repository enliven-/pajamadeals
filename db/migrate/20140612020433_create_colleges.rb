class CreateColleges < ActiveRecord::Migration
	def change
		create_table :colleges do |t|
			t.string :name, null: false
			t.string :abbr, null: false
			t.string :location, null: false
			t.string :zipcode, null: false
			t.string :city, null: false
			t.string :address, null: false
			t.string :state, null: false
			t.string :country, null: false
			t.string :token, null: false

			t.timestamps
		end
	end
end
