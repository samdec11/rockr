class ConcertsController < ApplicationController
  def new
    @concert = Concert.new
    @venues = Venue.order(:name)
  end
  def create
    @concert = Concert.create(params[:concert])
    venue = Venue.find(params[:venues].to_i)
    @concert.venue = venue
    @concert.save
    @venues = Venue.order(:name)
    @concerts = Concert.order(:date)
  end
end