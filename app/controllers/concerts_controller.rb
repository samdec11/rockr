class ConcertsController < ApplicationController
  def new
    @concert = Concert.new
    @venues = Venue.order(:name)
  end
  def create
    @concert = Concert.create(params[:concert])
    venue = Venue.find(params[:venues])
    @concert.venue = venue
  end
end