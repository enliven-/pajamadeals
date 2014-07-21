class AddIpToClassifieds < ActiveRecord::Migration
  def change
    add_column :classifieds, :ip, :string
  end
end
