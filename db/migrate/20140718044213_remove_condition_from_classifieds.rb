class RemoveConditionFromClassifieds < ActiveRecord::Migration
  def change
    remove_column :classifieds, :condition
  end
end
