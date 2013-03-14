require 'spec_helper'

describe Venue do
  describe '.new' do
    it "creates an instance of venue" do
      venue = Venue.new
      expect(venue).to be_an_instance_of(Venue)
    end
  end

  describe '.create' do
    it "should be an instance of venue" do
      venue = Venue.create(name: "MSG")
      expect(venue.id).to_not be nil
      expect(venue.name).to eq 'MSG'
    end
  end
end
