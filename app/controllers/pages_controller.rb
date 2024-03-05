class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @clothings = Clothing.all
  end
end
