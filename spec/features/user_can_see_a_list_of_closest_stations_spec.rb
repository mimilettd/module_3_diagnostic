require 'rails_helper'

describe "Stations" do
  it "User can view 10 closest stations" do
    visit '/'

    fill_in "q", with: "80203"

    click_on "Locate"

    expect(current_path).to eq("/search")
    expect(stations.count).to eq(10)

    stations.each do |station|
      expect(station.category).to eq("Electric" || "Propane")
    end
  end
end
