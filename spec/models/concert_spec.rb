require 'spec_helper'

describe Concert do
  describe '.new' do
    it "creates an instance of concert" do
      concert = Concert.new
      expect(concert).to be_an_instance_of(Concert)
    end
  end

  describe '.create' do
    it "should be an instance of concert" do
      venue = Venue.create(:name => 'MSG')
      concert = Concert.create(artist: "The Beatles", date: '2013-12-25')
      concert.venue = venue
      expect(concert.id).to_not be nil
      expect(concert.artist).to eq 'The Beatles'
      expect(concert.date.strftime('%m/%d/%y')).to eq '12/25/13'
      expect(concert.venue.name).to eq 'MSG'
    end
  end
end