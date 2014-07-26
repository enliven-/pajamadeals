class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :college_id, :integer
    add_column :users, :name, :string
    add_column :users, :token, :string
    add_column :users, :active, :boolean, default: true
    add_column :users, :admin, :boolean, default: false
    add_column :users, :mobile, :string
    add_column :users, :guest, :boolean, default: false
  end

  def migrate(direction)
    super
    # Create a default user
    User.create!(email: 'bhushanlodha@gmail.com', password: 'betterlabs', mobile: '9975454384', admin: true) if direction == :up
  end
end
