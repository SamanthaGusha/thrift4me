class ClothingsController < ApplicationController
  def index
    @clothing = Clothing.all
    if params[:query].present?
      @clothings = Clothing.search_by_title_and_description(params[:query])
    else
      @clothings = Clothing.all
    end
    @markers = @clothing.geocoded.map do |clothing|
      {
        lat: clothing.latitude,
        lng: clothing.longitude
      }
    end
  end

  def show
    @clothing = Clothing.find(params[:id])

    @markers = []

    if @clothing.geocoded?
      @marker = {
        lat: @clothing.latitude,
        lng: @clothing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {clothing: @clothing }),
        marker_html: render_to_string(partial: "marker", locals: {clothing: @clothing })
      }
      @markers << @marker
    end
  end

  def new
    @clothing = Clothing.new
  end

  def create
    @clothing = Clothing.new(clothing_params)
    if @clothing.save
      redirect_to clothings_path, notice: 'Clothing item was successfully created.'
    else
      render :new
    end
  end

  private

  def clothing_params
    params.require(:clothing).permit(:title, :description, :price, :size, :user_id, :body, :photo, :address, :available)
  end
end
