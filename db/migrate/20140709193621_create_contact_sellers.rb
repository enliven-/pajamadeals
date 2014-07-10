class CreateContactSellers < ActiveRecord::Migration
  def change
    create_table :contact_sellers do |t|
      t.string :name
      t.string :email
      t.string :mobile_number
      t.text :message
      t.integer :user_id
      t.integer :classified_id

      t.timestamps
    end
  end
end
