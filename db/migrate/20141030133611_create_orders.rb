class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :classified_id
      t.integer :handler_id
      t.integer :college_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
