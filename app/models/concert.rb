class Concert < ActiveRecord::Base
  attr_accessible :artist, :date
  belongs_to :venue, :inverse_of => :concerts
end