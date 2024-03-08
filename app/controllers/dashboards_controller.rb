class DashboardsController < ApplicationController

  def renter
    @rental_requests = current_user.rentals.includes(:clothing)


    # @rental_requests = @rental_requests.where(user_id: current_user)
    @past_rentals = current_user.past_rentals
  end

  def rentee
    @rental_requests = current_user.rentals.includes(:clothing)

    # @rental_requests = @rental_requests.where(user_id: current_user)
    @past_rentals = current_user.past_rentals
  end

  def update_requests
    @rental_request = Rental.find(params[:id])
    # authorize! :update, @rental_request

    case params[:action]
    when 'accept'
      @rental_request.update(status: :accepted)
    when 'reject'
      @rental_request.update(status: :rejected)
    else
      'pending'
    end
    redirect_to dashboard_rentee_path, notice: "Request #{@rental_request.id} has been #{@rental_request.status}"
  end

end
