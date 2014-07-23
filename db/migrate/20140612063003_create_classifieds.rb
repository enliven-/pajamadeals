class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :college_id
      t.string :price
      t.boolean :list, default: true
      t.string :token
      t.string :condition

      t.timestamps
    end
  end
end
