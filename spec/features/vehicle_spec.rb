require 'rails_helper'

RSpec.feature 'Managing vehicles' do
  scenario 'List all vehicles' do
    Vehicle.create!(nickname: 'Car 1', make: 'DeLorean', model: 'XX', year: 1985, mileage: 30, purchase_date: '1985-07-03')
    Vehicle.create!(nickname: 'Car 2', make: 'BMW', model: 'YY', year: 1990, mileage: 20, purchase_date: '1995-04-09')
    Vehicle.create!(nickname: 'Car 3', make: 'Mercedes', model: 'ZZ', year: 1995, mileage: 50, purchase_date: '1996-06-15')

    visit vehicles_path

    expect(page).to have_content 'Vehicles'
    expect(page).to have_selector 'p', count: 3
  end

  # scenario 'Create an vehicle' do
  #   visit new_vehicle_path

  #   fill_in 'Nickname', with: 'The New Car'
  #   fill_in 'Make', with: 'Yugo'
  #   fill_in 'Make', with: '60efi'
  #   fill_in 'Year', with: '1979'
  #   fill_in 'Mileage', with: '15673'
  #   fill_in 'Purchase Date', with: '1980-02-05'
  #   click_on 'Create vehicle'
  #   expect(page).to have_content(/success/i)
  # end

  # scenario 'View a vehicle' do
  #   vehicle = Vehicle.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")

  #   visit "/vehicles/#{vehicle.id}"

  #   expect(page.find('h1')).to have_content 'One Stupid Trick'
  #   expect(page).to have_content "You won't believe what they did next..."
  # end

  # scenario 'Update an vehicle' do
  #   vehicle = vehicle.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")

  #   visit "vehicles/#{vehicle.id}/edit"

  #   fill_in 'Title', with: 'A Different Trick'
  #   fill_in 'Body', with: 'Much disbelief. Wow.'
  #   click_on 'Update vehicle'

  #   expect(page).to have_content(/success/i)
  #   expect(page.find('h1')).to have_content 'A Different Trick'
  #   expect(page).to have_content 'Much disbelief. Wow.'
  # end

  # scenario 'Delete an vehicle' do
  #   vehicle = vehicle.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")

  #   visit "vehicles/#{vehicle.id}/edit"

  #   click_on 'Delete vehicle'

  #   expect(page).to have_content(/success/i)
  # end

end
