class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :user_id
      t.integer :college_id
      t.string :expected_price
      t.string :retail_price
      t.string :suggested_price
      t.integer :listing_type
      t.boolean :list, default: true
      t.string :token
      t.string :isbn
      t.string :edition
      t.string :condition

      t.timestamps
    end
  end
end
