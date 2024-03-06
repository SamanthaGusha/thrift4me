class DashboardsController < ApplicationController
  def show
    @my_clothing = Clothing.where(user_id: current_user.id)
    @my_rentals = Rental.where(user_id: current_user.id)
  end
end
