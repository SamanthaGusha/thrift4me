class Clothing < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy

  validates :title, :description, :price, :size, :available, presence: true
  validates :description, length: { minimum: 6, message: "Must be longer than 6 characters" }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
                  against: %i[title description],
                  using: {
                    tsearch: { prefix: true }
                  }
end
