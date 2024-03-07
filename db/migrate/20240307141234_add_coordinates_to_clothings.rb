class AddCoordinatesToClothings < ActiveRecord::Migration[7.1]
  def change
    add_column :clothings, :latitude, :float
    add_column :clothings, :longitude, :float
  end
end
