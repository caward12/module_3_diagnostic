require 'rails_helper'

RSpec.describe "search form" do
  it "User can search nearby stations" do
    VCR.use_cassette("search") do
      visit root_path
      fill_in('search', :with => "80203")

      click_on "Locate"

      expect(current_path).to eq(search_path)

      expect(page).to have_content()
    end
  end
end