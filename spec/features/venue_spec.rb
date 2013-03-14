require 'spec_helper'

describe 'Venues' do
  describe 'GET /' do
    it 'displays new venue link' do
      visit root_path
      page.should have_link('New Venue')
    end
  end

  describe 'GET /venues/new' do
    it "displays the create venue button", :js => true do
      visit root_path
      click_link("New Venue")
      page.should have_button('Cancel')
      page.should have_button('Create Venue')
    end
  end

  describe 'POST /venues/' do
    it "creates a new venue", :js => true do
      visit root_path
      click_link('New Venue')
      fill_in('Name', :with => 'MSG')
      click_button('Create Venue')
      page.should_not have_button('Create Venue')
      page.should have_text("MSG")
      expect(Venue.first.name).to eq 'MSG'
    end

    it "should show the new venue", :js => true do
      visit root_path
      click_link('New Venue')
      fill_in('Name', :with => 'MSG')
      click_button('Create Venue')
      page.should have_text('MSG')
    end
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