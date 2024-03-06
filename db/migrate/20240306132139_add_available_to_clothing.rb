class AddAvailableToClothing < ActiveRecord::Migration[7.1]
  def change
    add_column :clothings, :available, :boolean, default: true
  end
end

