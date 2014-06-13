class AddTokenToClassifieds < ActiveRecord::Migration
  def change
    add_column :classifieds, :token, :string
  end
end
