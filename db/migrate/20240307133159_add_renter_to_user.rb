class AddRenterToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :renter, :boolean, default: true
  end
end
