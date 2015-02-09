require 'rails_helper'

RSpec.feature 'Managing events:' do

  scenario 'View an event' do
    vehicle = Vehicle.create!(nickname: 'Car 1', make: 'DeLorean', model: 'XX', year: 1985, mileage: 30, purchase_date: '1985-07-03')
    vendor_abc = Vendor.create!(name: 'ABC Auto Supply')
    cat_repair = Category.create!(name: 'repair')
    new_event = vehicle.events.create(name: 'broken windshield', category: cat_repair, vendor: vendor_abc, cost: 130.00, event_date: '2015-02-15', due_date: '2015-02-15', notes: 'free wipers')

    #visit event#show
    visit vehicle_event_path(vehicle, new_event)

    expect(page).to have_content "windshield"
  end

  scenario 'Create an event' do
    vehicle = Vehicle.create!(nickname: 'Car 1', make: 'DeLorean', model: 'XX', year: 1985, mileage: 30, purchase_date: '1985-07-03')
    vendor_abc = Vendor.create!(name: 'ABC Auto Supply')
    cat_repair = Category.create!(name: 'repair')
    new_event = vehicle.events.create(name: 'broken windshield', category: cat_repair, vendor: vendor_abc, cost: 130.00, event_date: '2015-02-15', due_date: '2015-02-15', notes: 'free wipers')

    #visit events#new
    visit new_vehicle_event_path(vehicle)

    fill_in 'Name', with: 'replace headlights'
    fill_in 'Category', with: cat_repair.id
    fill_in 'Vendor', with: vendor_abc.id
    fill_in 'Cost', with: 80.00
    fill_in 'Event date', with: '2015-01-02'
    fill_in 'Due date', with: '2015-01-02'
    click_on 'Create Event'

    #go to event#show
    expect(page).to have_content 'headlights'
  end

  scenario 'Update an event' do
    vehicle = Vehicle.create!(nickname: 'Car 1', make: 'DeLorean', model: 'XX', year: 1985, mileage: 30, purchase_date: '1985-07-03')
    vendor_abc = Vendor.create!(name: 'ABC Auto Supply')
    cat_repair = Category.create!(name: 'repair')
    new_event = vehicle.events.create(name: 'broken windshield', category: cat_repair, vendor: vendor_abc, cost: 130.00, event_date: '2015-02-15', due_date: '2015-02-15', notes: 'free wipers')

    #visit events#edit
    visit edit_vehicle_event_path(vehicle, new_event)

    fill_in 'Name', with: 'replace wheels'
    fill_in 'Category', with: cat_repair.id
    fill_in 'Vendor', with: vendor_abc.id
    fill_in 'Cost', with: 300.00
    fill_in 'Event date', with: '2015-02-25'
    fill_in 'Due date', with: '2015-02-25'
    click_on 'Update Event'

    #go to event#show
    expect(page).to have_content "wheels"
  end

  scenario 'Delete a event' do
    vehicle = Vehicle.create!(nickname: 'Car 1', make: 'DeLorean', model: 'XX', year: 1985, mileage: 30, purchase_date: '1985-07-03')
    vendor_abc = Vendor.create!(name: 'ABC Auto Supply')
    cat_repair = Category.create!(name: 'repair')
    new_event = vehicle.events.create(name: 'broken windshield', category: cat_repair, vendor: vendor_abc, cost: 130.00, event_date: '2015-02-15', due_date: '2015-02-15', notes: 'free wipers')

    #visit event#show
    visit vehicle_event_path(vehicle, new_event)

    click_on 'Delete'

    #go to events#index
    expect(page).to have_content 'Events for'
  end

end
