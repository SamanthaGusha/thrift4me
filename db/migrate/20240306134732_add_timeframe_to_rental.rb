class AddTimeframeToRental < ActiveRecord::Migration[7.1]
  def change
    add_column :rentals, :from, :date
    add_column :rentals, :to, :date
  end
end
