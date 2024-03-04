class AddSizeToClothings < ActiveRecord::Migration[7.1]
  def change
    add_column :clothings, :size, :string
  end
end
