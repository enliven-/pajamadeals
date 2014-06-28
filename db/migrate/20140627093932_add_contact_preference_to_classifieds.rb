class AddContactPreferenceToClassifieds < ActiveRecord::Migration
  def change
    add_column :classifieds, :contact_preference, :string
  end
end
