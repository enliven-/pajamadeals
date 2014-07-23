class CreateColleges < ActiveRecord::Migration
	def change
		create_table :colleges do |t|
			t.string :name
			t.string :abbr
			t.string :zipcode
      t.string :city
			t.string :token

			t.timestamps
		end
	end
end
