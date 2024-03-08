class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    @rentals = Rental.all
  end

  def show
    price = @rental.clothing.price * (@rental.to - @rental.from)
    @total_price = price.to_i
  end

  def new
    @rental = Rental.new
    @clothing = Clothing.find(params[:clothing_id])
  end

  def edit
  end

  def create
    @rental = Rental.new(rental_params)
    @clothing = Clothing.find(params[:clothing_id])
    @rental.user = current_user
    @rental.status = 'pending'
    if @rental.save
      redirect_to clothing_rental_path(@clothing, @rental), notice: 'Rental was successfully requested'
    else
      render :new
    end
  end

  def update
    @rental = Rental.find(params[:id])
    if params[:action] == "accept"
      @rental.update!(status: :accepted)
      @rental.clothing_item.update!(available: false) # Mark clothing unavailable
      redirect_to rental_approval_path, notice: "Rental accepted!"
    elsif params[:action] == "reject"
      @rental.update!(status: :rejected)
      redirect_to rental_rejection_path, notice: "Rental rejected."
    else
      redirect_to dashboard_rentee_path, alert: "Invalid action."
    end

  end

  def accept
    @rental = Rental.find(params[:id])
    @rental.update(status: 1)
    redirect_to dashboard_renter_path, notice: 'Rental accepted successfully.'

  end

  def reject
    @rental = Rental.find(params[:id])
    @rental.update(status: 2)
    redirect_to dashboard_renter_path, notice: 'Rental rejected successfully.'
  end

  def destroy
    @rental.destroy
    redirect_to rentals_url, notice: 'Rental was successfully destroyed.'
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:from, :to, :clothing_id, :user_id, :status)
  end
    
end
