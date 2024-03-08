class DashboardsController < ApplicationController

  def index
    # @pending_rentals = current_user.rentals.select{ |rental| rental.status["pending"] }
    @selected_dashboard = params[:dasboard] || 'my_rentals'

    @rental_requests = current_user.rental_requests.includes(:clothing)

    case @selected_dashboard
    when 'my_rentals'
      @rental_requests = current_user.rental_requests.includes(:clothing)
      # @rental_requests.where(renter: current_user)
    when 'rented_items'
      @rental_requests = @rental_requests.where(rentee: current_user)
    else
      raise "Invalid dashboard selected:"
    end

    @past_rentals = current_user.past_rentals
  end

  def update_requests
    @rental_request = Rental.find(params[:id])
    authorize! :update, @rental_request

    case params[:action]
    when 'accept'
      @rental_request.update(status: :accepted)
    when 'reject'
      @rental_request.update(status: :rejected)
    else
      'pending'
    end
    redirect_to rentee_user_dashboard_path(params[:id]), notice: "Request #{@rental_request.id} has been #{@rental_request.status}"
  end

  private

  def past_rentals
    current_user.rental_requests.where('rental_end_date < ?', Date.today).includes(:clothing)
  end

end
