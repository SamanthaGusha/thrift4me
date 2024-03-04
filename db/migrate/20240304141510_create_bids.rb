class CreateBids < ActiveRecord::Migration[7.1]
  def change
    create_table :bids do |t|
      t.float :bid_price
      t.string :status
      t.references :clothing, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
