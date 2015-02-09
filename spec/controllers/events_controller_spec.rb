require 'rails_helper'

RSpec.describe EventsController do

  let(:vehicle) {
    Vehicle.create!(nickname: 'Car 1', make: 'DeLorean', model: 'XX', year: 1985, mileage: 30, purchase_date: '1985-07-03')
  }
  let(:vendor) {
    Vendor.create!(name: 'ABC Auto Supply')
  }
  let(:category) {
    Category.create!(name: 'repair')
  }
  let(:valid_attributes) {
    { name: 'broken windshield', category: cat_repair, vendor: vendor_abc, cost: 130.00, event_date: '2015-02-15', due_date: '2015-02-15', notes: 'free wipers'}
  }
  let(:invalid_attributes) {
    { name: nil, category: cat_repair, vendor: vendor_abc, cost: 130.00, event_date: '2015-02-15', due_date: '2015-02-15', notes: 'free wipers'}
  }

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

  #   it 'renders the index template' do
  #     get :index
  #     expect(response).to render_template('index')
  #   end

  #   it 'assigns @events' do
  #     events = Event.all
  #     get :index
  #     expect(assigns(:events)).to eq events
  #   end
  # end #describe 'GET index'

  # describe 'GET new' do
  #   it 'has a 200 status code' do
  #     get :new
  #     expect(response.status).to eq 200
  #   end

  #   it 'renders the new template' do
  #     get :new
  #     expect(response).to render_template('new')
  #   end

  #   it 'assigns @event' do
  #     get :new
  #     expect(assigns(:event)).to be_a_new Event
  #   end
  # end #describe 'GET new'

  # describe 'GET show' do
  #   it 'has a 200 status code' do
  #     event = Event.create!(valid_attributes)
  #     get :show, id: event
  #     expect(response.status).to eq 200
  #   end

  #   it 'renders the show template' do
  #     event = Event.create!(valid_attributes)
  #     get :show, id: event
  #     expect(response).to render_template('show')
  #   end

  #   it 'assigns @event' do
  #     event = Event.create!(valid_attributes)
  #     get :show, id: event
  #     expect(assigns(:event)).to eq event
  #   end
  # end #describe 'GET show'

  # describe 'POST create' do
  #   context 'with valid attributes' do
  #     it 'saves a new event' do
  #       expect {
  #         post :create, event: valid_attributes
  #       }.to change(Event, :count).by 1
  #     end

  #     it 'assigns @event' do
  #       post :create, event: valid_attributes
  #       expect(assigns(:event)).to be_an Event
  #       expect(assigns(:event)).to be_persisted
  #     end

  #     it 'redirects to the created event' do
  #       post :create, event: valid_attributes
  #       expect(response).to redirect_to events_path
  #     end
  #   end

  #   context 'with invalid attributes' do
  #     it 'assigns @event, but does not save a new event' do
  #       post :create, event: invalid_attributes
  #       expect(assigns(:event)).to be_a_new Event
  #     end

  #     it 're-renders the new template' do
  #       post :create, event: invalid_attributes
  #       expect(response).to render_template 'new'
  #     end
  #   end
  # end #describe 'POST create'

  # describe 'GET edit' do
  #   it 'has a 200 status code' do
  #     event = Event.create!(valid_attributes)
  #     get :edit, id: event
  #     expect(response.status).to eq 200
  #   end

  #   it 'renders the edit template' do
  #     event = Event.create!(valid_attributes)
  #     get :edit, id: event
  #     expect(response).to render_template('edit')
  #   end

  #   it 'assigns @event' do
  #     event = Event.create!(valid_attributes)
  #     get :edit, id: event
  #     expect(assigns(:event)).to eq event
  #   end
  # end #describe 'GET edit'

  # describe 'PATCH update' do
  #   context 'with valid attributes' do
  #     let(:new_attributes) {
  #       { nickname: 'Car New Attributes', make: 'Yugo', model: 'ZZ', year: 1981, mileage: 30000, purchase_date: '1982-09-30'}
  #     }

  #     it 'updates the requested event' do
  #       event = Event.create!(valid_attributes)
  #       patch :update, id: event, event: new_attributes
  #       event.reload
  #       expect(event.nickname).to eq new_attributes[:nickname]
  #     end

  #     it 'assigns @event' do
  #       event = Event.create!(valid_attributes)
  #       patch :update, id: event, event: new_attributes
  #       expect(assigns(:event)).to eq event
  #     end

  #     it 'redirects to the event' do
  #       event = Event.create!(valid_attributes)
  #       patch :update, id: event, event: new_attributes
  #       expect(response).to redirect_to event_path
  #     end
  #   end

  #   context 'with invalid attributes' do
  #     it 'assigns @event' do
  #       event = Event.create!(valid_attributes)
  #       patch :update, id: event, event: invalid_attributes
  #       expect(assigns(:event)).to eq event
  #     end

  #     it 're-renders the edit template' do
  #       event = Event.create!(valid_attributes)
  #       patch :update, id: event, event: invalid_attributes
  #       expect(response).to render_template('edit')
  #     end
  #   end
  # end #describe 'PATCH update'

  # describe 'DELETE destroy' do
  #   it 'destroys the requested event' do
  #     event = Event.create!(valid_attributes)
  #     expect {
  #       delete :destroy, id: event
  #     }.to change(Event, :count).by(-1)
  #   end

  #   it 'redirects to the events list' do
  #     event = Event.create!(valid_attributes)
  #     delete :destroy, id: event
  #     expect(response).to redirect_to events_path
  #   end
  end #describe 'DELETE destroy'

end
