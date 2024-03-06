class RemovePriceFromRentals < ActiveRecord::Migration[7.1]
  def change
    remove_column :rentals, :price, :float
  end
end
