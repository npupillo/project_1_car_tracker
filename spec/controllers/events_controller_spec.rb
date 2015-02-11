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
  let(:valid_event_attributes) {
    { name: 'broken windshield', category: category, vendor: vendor, cost: 130.00, event_date: '2015-02-15', due_date: '2015-02-15', notes: 'free wipers'}
  }
  let(:invalid_event_attributes) {
    { name: nil, category: category, vendor: vendor, cost: 130.00, event_date: '2015-02-15', due_date: '2015-02-15', notes: 'free wipers'}
  }

  before(:all) do
    Event.destroy_all
    Vehicle.destroy_all
    Vendor.destroy_all
    Category.destroy_all
  end

  describe 'GET new' do
    it 'has a 200 status code' do
      get :new, vehicle_id: vehicle
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      get :new, vehicle_id: vehicle
      expect(response).to render_template('new')
    end

    it 'assigns @event' do
      get :new, vehicle_id: vehicle
      expect(assigns(:event)).to be_a_new Event
    end
  end #describe 'GET new'

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves a new event' do
        expect {
          post :create, event: valid_event_attributes, vehicle_id: vehicle, vendor_id: vendor, category_id: category
        }.to change(Event, :count).by 1
      end

      it 'assigns @event' do
        post :create, event: valid_event_attributes, vehicle_id: vehicle
        expect(assigns(:event)).to be_an Event
        expect(assigns(:event)).to be_persisted
      end

      it 'redirects to the vehicle' do
        post :create, event: valid_event_attributes, vehicle_id: vehicle
        expect(response).to redirect_to(vehicle_path(vehicle))
      end
    end # context

    context 'with invalid attributes' do
      it 'assigns @event, but does not save a new event' do
        post :create, event: invalid_event_attributes, vehicle_id: vehicle
        expect(assigns(:event)).to be_a_new Event
      end

      it 're-renders the new template' do
        post :create, event: invalid_event_attributes, vehicle_id: vehicle
        expect(response).to render_template 'new'
      end
    end
  end #describe 'POST create'

  describe 'GET edit' do
    context 'with show name' do
      let(:event) {
        vehicle.events.create!(name: 'The New Event Name')
      }

      it 'has a 200 status code' do
        get :edit, vehicle_id: vehicle, id: event
        expect(response.status).to eq 200
      end

      it 'renders the edit template' do
        get :edit,  vehicle_id: vehicle, id: event
        expect(response).to render_template('edit')
      end

      it 'assigns @event' do
        get :edit,  vehicle_id: vehicle, id: event
        expect(assigns(:event)).to eq event
      end
    end # context
  end # 'GET edit'

  describe 'PATCH update' do
    context 'with valid attributes' do
      let(:new_event_valid_attributes) {
        { name: 'This Is A New Event' }
      }

        it 'updates the requested event' do
          event = Event.create!(valid_event_attributes)
          vehicle.events << event
          patch :update, vehicle_id: vehicle, id: event, event: new_event_valid_attributes
          event.reload
          expect(event.name).to eq new_event_valid_attributes[:name]
        end

        it 'assigns @event' do
          event = Event.create!(valid_event_attributes)
          vehicle.events << event
          patch :update, vehicle_id: vehicle, id: event, event: new_event_valid_attributes
          expect(assigns(:event)).to eq event
        end

        it 'redirects to the vehicle' do
          event = Event.create!(valid_event_attributes)
          vehicle.events << event
          patch :update, vehicle_id: vehicle, id: event, event: new_event_valid_attributes
          expect(response).to redirect_to(vehicle_path(vehicle))
        end
    end #context

        context 'with valid attributes' do
      let(:new_event_invalid_attributes) {
        { name: nil }
      }

      it 'assigns @event' do
        event = Event.create!(valid_event_attributes)
        vehicle.events << event
        patch :update, vehicle_id: vehicle, id: event, event: new_event_invalid_attributes
        expect(assigns(:event)).to eq event
      end

      it 're-renders the edit template' do
        event = Event.create!(valid_event_attributes)
        vehicle.events << event
        patch :update, vehicle_id: vehicle, id: event, event: new_event_invalid_attributes
        expect(response).to render_template('edit')
      end
    end # context
  end # 'PATCH update'

  describe 'DELETE destroy' do
    it 'destroys the requested comment' do
      event = Event.create!(valid_event_attributes)
      vehicle.events << event
      expect {
        delete :destroy, vehicle_id: vehicle, id: event
      }.to change(Event, :count).by(-1)
    end

    it 'redirects to the vehicle list' do
      event = Event.create!(valid_event_attributes)
      vehicle.events << event
      delete :destroy, vehicle_id: vehicle, id: event
      expect(response).to redirect_to redirect_to(vehicle_path(vehicle))
    end
  end # describe 'DELETE destroy'

end
