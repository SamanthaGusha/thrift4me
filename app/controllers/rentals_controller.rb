class RentalController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    @rentals = Rental.all
  end

  def show
  end

  def new
    @rental = Rental.new
  end

  def edit
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      redirect_to @rental, notice: 'Rental was successfully created.'
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
      params.require(:rental).permit(:status, :price, :clothing_id, :user_id)
    end
end
