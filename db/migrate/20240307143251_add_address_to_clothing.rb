class AddAddressToClothing < ActiveRecord::Migration[7.1]
  def change
    add_column :clothings, :address, :string
  end
end
