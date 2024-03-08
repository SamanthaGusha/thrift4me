class Clothing < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :photo

  validates :title, :description, :price, :size, :available, presence: true
  validates :description, length: { minimum: 6, message: "Must be longer than 6 characters" }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
                  against: %i[title description],
                  using: {
                    tsearch: { prefix: true }
                  }
end
