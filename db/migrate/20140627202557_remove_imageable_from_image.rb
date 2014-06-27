class RemoveImageableFromImage < ActiveRecord::Migration
  def change
  	remove_column :images, :imageable_type
  	remove_column :images, :imageable_id

  	add_column :images, :classified_id, :integer
  end
end
