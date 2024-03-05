class ClothingsController < ApplicationController

  def index
    @clothing = Clothing.all
  end

  def show
    @clothing = Clothing.find(params[:id])
  end

  def new
    @clothing = Clothing.new
  end

  def create
    @clothing = Clothing.new(clothing_params)
  end

  private

  def clothing_params
    params.require(:clothing).permit(:title, :description, :price, :size, :user_id)
  end
end
