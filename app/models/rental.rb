class Rental < ApplicationRecord
  belongs_to :clothing
  belongs_to :user

  enum :status, { pending: 0, approved: 1, rejected: 2 }

  def self.pending?
    status == "pending"
  end
end
