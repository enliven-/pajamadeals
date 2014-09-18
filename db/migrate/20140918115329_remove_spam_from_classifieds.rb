class RemoveSpamFromClassifieds < ActiveRecord::Migration
  def change
    remove_column :classifieds, :spam, :boolean
    add_column :classifieds, :spam, :boolean, default: false
  end
end
