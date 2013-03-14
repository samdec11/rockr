class HomeController < ApplicationController
  def index
    @venues = Venue.order(:name)
    @concerts = Concert.order(:date)
  end
end