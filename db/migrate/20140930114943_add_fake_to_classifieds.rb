class AddFakeToClassifieds < ActiveRecord::Migration
  def change
    add_column :classifieds, :fake, :boolean
  end
end
