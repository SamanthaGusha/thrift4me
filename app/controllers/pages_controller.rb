class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @clothings = Clothing.search_by_title_and_description(params[:query])
    else
      @clothings = Clothing.all
    end
  end
end
