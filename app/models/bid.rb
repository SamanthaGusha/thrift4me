class Bid < ApplicationRecord
  belongs_to :clothing
  belongs_to :user
  validates :bid_price, :status, presence: true
end
