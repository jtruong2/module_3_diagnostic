require 'rails_helper'
RSpec.describe "User enters zipcode in search" do
  it "sees a page with information on stations" do
    # As a user
    # When I visit "/"
    visit root_path
    # And I fill in the search form with 80203
    fill_in('Search by zip...', :with => '80203')
    # And I click "Locate"
    click_on "Locate"
    # Then I should be on page "/search" with parameters visible in the url
    expect(current_path).to eq(search_path)
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_content()
    # And the stations should be limited to Electric and Propane
    expect(page).to_not have_content("E85")
    expect(page).to_not have_content("HY")
    expect(page).to_not have_content("LNG")
    expect(page).to_not have_content("BD")
    expect(page).to_not have_content("CNG")
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    expect(page).to
  end
end
