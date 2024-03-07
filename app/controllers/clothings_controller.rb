class ClothingsController < ApplicationController
  def index
    @clothing = Clothing.all
    if params[:query].present?
      @clothings = Clothing.search_by_title_and_description(params[:query])
    else
      @clothings = Clothing.all
    end
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
