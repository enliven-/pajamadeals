class RemoveImageFromClassified < ActiveRecord::Migration
  def change
    remove_column :classifieds, :image, :string
  end
end
