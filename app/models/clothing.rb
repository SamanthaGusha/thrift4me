class Clothing < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_one_attached :photo
  validates :title, :description, :price, :size, presence: true
  validates :description, length: { minimum: 6, message: "Must be longer than 6 characters" }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
