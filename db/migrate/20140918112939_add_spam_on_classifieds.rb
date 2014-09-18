class AddSpamOnClassifieds < ActiveRecord::Migration
  def change
    add_column :classifieds, :spam, :boolean, default: true
  end
end
