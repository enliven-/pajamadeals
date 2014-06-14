class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :user_id
      t.integer :college_id
      t.string :price
      t.integer :listing_type
      t.boolean :list, default: true

      t.timestamps
    end
  end
end
