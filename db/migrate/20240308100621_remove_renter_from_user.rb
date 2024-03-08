class RemoveRenterFromUser < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :renter, :boolean
  end
end
