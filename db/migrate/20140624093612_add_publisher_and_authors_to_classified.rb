class AddPublisherAndAuthorsToClassified < ActiveRecord::Migration
  def change
    add_column :classifieds, :publisher, :string
    add_column :classifieds, :authors, :string
  end
end
