require 'spec_helper'

describe 'Concerts' do
  describe 'GET /' do
    it 'displays new concert link' do
      visit root_path
      page.should have_link('New Concert')
    end
  end

  describe 'GET /concert/new' do
    it "displays the create concert button", :js => true do
      visit root_path
      click_link("New Concert")
      page.should have_button('Cancel')
      page.should have_button('Create Concert')
    end
  end

  describe 'POST /concerts/' do
    it "creates a new concert", :js => true do
      Venue.create(name: 'MSG')
      visit root_path
      click_link('New Concert')
      fill_in('Artist', :with => 'The Beatles')
      fill_in('Date', :with => '2013-12-25')
      select('MSG', :from =>'venues')
      click_button('Create Concert')
      page.should_not have_button('Create Concert')
      expect(Concert.first.artist).to eq 'The Beatles'
    end
    # it "should show the new concert", :js => true do
    #   Venue.create(name: 'MSG')
    #   visit root_path
    #   click_link('New Concert')
    #   fill_in('Artist', :with => 'The Beatles')
    #   fill_in('Date', :with => '2013-12-25')
    #   select('MSG', :from =>'venues')
    #   click_button('Create Concert')
    #   page.should have_text('The Beatles')
    # end
  end

  describe 'cancel button' do
    it "should hide the form", :js => true do
      visit root_path
      click_link('New Venue')
      click_button('Cancel')
      page.should_not have_button('Create Venue')
    end
  end
end