class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :user_id
      t.integer :college_id
      t.string :price
      t.integer :type
      t.integer :status

      t.timestamps
    end
  end
end
