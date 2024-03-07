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
    if @rental.update(rental_params)
      redirect_to @rental, notice: 'Rental was successfully updated.'
    else
      render :edit
    end
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
