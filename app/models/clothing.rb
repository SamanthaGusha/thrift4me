class Clothing < ApplicationRecord
  belongs_to :user
  has_many :bids
  validates :title, :description, :price, :size, presence: true
  validates :description, length: { minimum: 6, message: "Must be longer than 6 characters" }
end
