class HomeController < ApplicationController
  def index
    @venues = Venue.order(:name)
  end
end