require 'rails_helper'

RSpec.describe "countires index page", type: :feature do
  it "shows all countries and citty counts" do
    england = Country.create!(name: 'England', population: 200, gdp: 50, has_monarch: true)
    us = Country.create!(name: 'US', population: 500, gdp: 100, has_monarch: false)

    york = england.cities.create!(name: 'York', population: 50, capital: false)
    new_york = us.cities.create!(name: 'New York', population: 250, capital: false)


    visit "/countries"

    expect(page).to have_content("#{us.name}: cities count = #{us.cities.length}")
    expect(page).to have_content("#{england.name}: cities count = #{england.cities.length}")

  end

  it "Shows a link to other pages" do
    england = Country.create!(name: 'England', population: 200, gdp: 50, has_monarch: true)
    us = Country.create!(name: 'US', population: 500, gdp: 100, has_monarch: false)



    visit "/countries"

    expect(page).to have_link("countries")
    expect(page).to have_link("cities")
    expect(page).to have_link("Update #{england.name}")
    expect(page).to have_link("Update #{us.name}")

    expect(page).to have_link("Delete")
  end

  it "shows right order for countries " do

    england = Country.create!(name: 'England', population: 200, gdp: 50, has_monarch: true)
    us = Country.create!(name: 'US', population: 500, gdp: 100, has_monarch: false)

    all = Country.all

    visit "/countries"
    assert_operator all.index(england), :<, all.index(us)
  end

  it 'it can deleat a country with its cities' do

    england = Country.create!(name: 'England', population: 200, gdp: 50, has_monarch: true)
    us = Country.create!(name: 'US', population: 500, gdp: 100, has_monarch: false)

    london = england.cities.create!(name: 'London', population: 100, capital: true)
    york = england.cities.create!(name: 'York', population: 50, capital: true)
    denver = us.cities.create!(name: 'Denver', population: 50, capital: true)

    visit "/countries/#{england.id}"

    click_link 'Delete Country'

    expect(current_path).to eq("/countries")

    expect(page).to have_content('US')
    expect(page).to have_no_content('England')
  end
end
