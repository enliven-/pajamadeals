class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :classified_id
      t.integer :user_id
      t.text :message
      t.boolean :picked
      t.boolean :delivered
      t.boolean :cancelled
      t.timestamp :picked_at
      t.timestamp :delivered_at
      t.timestamp :cancelled_at

      t.timestamps
    end
  end
end
