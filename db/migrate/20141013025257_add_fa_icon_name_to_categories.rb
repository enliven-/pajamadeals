class AddFaIconNameToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :fa_icon_label, :string
  end
end
