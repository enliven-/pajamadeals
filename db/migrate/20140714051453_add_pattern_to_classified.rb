class AddPatternToClassified < ActiveRecord::Migration
  def change
    add_column :classifieds, :pattern, :string
  end
end
