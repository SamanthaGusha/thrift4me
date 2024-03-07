class DashboardsController < ApplicationController

  def index
    @pending_rentals = current_user.rentals.select{ |rental| rental.status["pending"] }
  end

  def accept
    @rental = Rental.find(params[:id])
    @rental.update(status: 'accepted')
    redirect_to user_dashboard_path, notice: 'Rental status updated!'
  end

  def renter
    @active_rentals = current_user.rentals.select{ |rental| rental.status["accepted"] }
  end


end
