class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :publisher
      t.string :author
      t.string :isbn
      t.string :edition
      t.string :released_year
      t.string :retail_price
      t.string :university
      t.string :image

      t.timestamps
    end
  end
end
