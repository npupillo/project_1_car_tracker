require 'rails_helper'

RSpec.feature 'Managing vehicles' do
  scenario 'List all vehicles' do
    Vehicle.create!(nickname: 'Car 1', make: 'DeLorean', model: 'XX', year: 1985, mileage: 30, purchase_date: '1985-07-03')
    Vehicle.create!(nickname: 'Car 2', make: 'BMW', model: 'YY', year: 1990, mileage: 20, purchase_date: '1995-04-09')
    Vehicle.create!(nickname: 'Car 3', make: 'Mercedes', model: 'ZZ', year: 1995, mileage: 50, purchase_date: '1996-06-15')

    visit vehicles_path

    expect(page).to have_content 'Vehicles'
    expect(page).to have_selector 'h1', count: 1
  end

  scenario 'Create an vehicle' do
    visit new_vehicle_path

    fill_in 'Nickname', with: 'The New Car'
    fill_in 'Make', with: 'Yugo'
    fill_in 'Model', with: '60efi'
    fill_in 'Year', with: '1979'
    fill_in 'Mileage', with: '15673'
    fill_in 'Purchase date', with: '1980-02-05'
    click_on 'Create Vehicle'
    expect(page).to have_content 'Nickname'
  end

  scenario 'View a vehicle' do
    vehicle = Vehicle.create!(nickname: 'Car 4', make: 'Chevrolet', model: 'Big Wheel', year: 2007, mileage: 60000, purchase_date: '2009-09-09')

    visit vehicle_path(vehicle)

    expect(page).to have_content "Chevrolet"
  end

  scenario 'Update an vehicle' do
    vehicle = Vehicle.create!(nickname: 'Car 5', make: 'Toyota', model: 'Camry', year: 2010, mileage: 50000, purchase_date: '2011-02-01')


    visit edit_vehicle_path(vehicle)

    fill_in 'Nickname', with: 'Car 6'
    fill_in 'Make', with: 'Honda'
    fill_in 'Model', with: 'Civic'
    fill_in 'Year', with: '2002'
    fill_in 'Mileage', with: '87573'
    fill_in 'Purchase date', with: '2003-08-20'
    click_on 'Update Vehicle'

    expect(page).to have_content "Honda"
  end

  scenario 'Delete a vehicle' do
    vehicle = Vehicle.create!(nickname: 'Car 6', make: 'Dodge', model: 'Dart', year: 2013, mileage: 10000, purchase_date: '2013-07-15')

    visit vehicle_path(vehicle)

    click_on 'Delete'

    expect(page).to have_content 'Vehicles'
  end

end
