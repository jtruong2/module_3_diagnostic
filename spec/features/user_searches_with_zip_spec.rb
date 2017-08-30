require 'rails_helper'
RSpec.describe "User enters zipcode in search" do
  it "sees a page with information on stations" do
    # As a user
    # When I visit "/"
    visit root_path
    # And I fill in the search form with 80203
    fill_in(:q, :with => '80203')
    # And I click "Locate"
    click_on "Locate"

    output = JSON.parse(response.body)

      VCR.use_cassette("cassettes/user_searches_by_80203") do
      # Then I should be on page "/search" with parameters visible in the url
      expect(current_path).to eq(search_path)
      # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
      expect(output.count).to have_content(10)
      # And the stations should be limited to Electric and Propane
      expect(page).to_not have_content("E85")
      expect(page).to_not have_content("HY")
      expect(page).to_not have_content("LNG")
      expect(page).to_not have_content("BD")
      expect(page).to_not have_content("CNG")
      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      expect(output[0].station_name).to eq("Station name: UDR")
      expect(page).to have_content("Address: 800 Acoma St Denver, CO 80204")
      expect(page).to have_content("Fuel type: Electric")
      expect(page).to have_content("Distance: 0.31 mi")
      expect(page).to have_content("Access times: 24 hrs")
      expect(output[-1].station_name).to eq("PUBLIC STATIONS")
    end
  end
end
