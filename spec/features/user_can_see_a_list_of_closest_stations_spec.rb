require 'rails_helper'

describe "Stations" do
  it "User can view 10 closest stations" do
    visit '/'

    within(".form-group search-field") do
      fill_in :search, with: "80203"
    end

    click_on "Locate"

    expect(current_path).to eq("/search")
    expect(stations.count).to eq(10)

    stations.each do |station|
      expect(station.category).to eq("Electric" || "Propane")
    end
  end
end
