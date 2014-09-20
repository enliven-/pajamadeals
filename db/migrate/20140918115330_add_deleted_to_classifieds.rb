class AddDeletedToClassifieds < ActiveRecord::Migration
  def change
    add_column :classifieds, :deleted, :boolean, default: false
  end
end
