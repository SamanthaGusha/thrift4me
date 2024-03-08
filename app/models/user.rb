class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :rentals
  has_many :clothings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def past_rentals
    self.rentals.where('rentals.from < ?', Date.today).includes(:clothing)
  end

end
