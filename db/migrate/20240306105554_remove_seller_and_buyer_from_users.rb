class RemoveSellerAndBuyerFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :seller, :boolean
    remove_column :users, :buyer, :boolean
  end
end
