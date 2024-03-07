class Rental < ApplicationRecord
  belongs_to :clothing
  belongs_to :user
  validates :status, inclusion: { in: %w[pending approved rejected returned] }, presence: true
end

# sam is to do the seed file
