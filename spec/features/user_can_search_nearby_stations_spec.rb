require 'rails_helper'

RSpec.describe "search form" do
  it "User can search nearby stations" do
    VCR.use_cassette("search") do
      visit root_path
      fill_in "q", with: "80203"

      click_on "Locate"

      expect(current_path).to eq(search_path)

      expect(page).to have_content("Station name: UDR")
      expect(page).to have_content("Station address: 800 Acoma St Denver, CO 80204")
      expect(page).to have_content("Station fuel type: ELEC")
      expect(page).to have_content("Station distance: 0.31 miles")
      expect(page).to have_content("Station access times: 24 hours daily")

      expect(page).to have_content("Station name: Hyatt Regency Denver")
      expect(page).to have_content("Station address: 650 15th St Denver, CO 80202")
      expect(page).to have_content("Station fuel type: ELEC")
      expect(page).to have_content("Station distance: 1.03 miles")
      expect(page).to have_content("Station access times: 24 hours daily; pay lot")
    end
  end
end