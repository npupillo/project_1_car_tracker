require 'rails_helper'

RSpec.describe VehiclesController do
  let(:valid_attributes) {
    { nickname: 'Car 1', make: 'DeLorean', model: 'XX', year: 1985, mileage: 30, purchase_date: '1985-07-03'}
  }
  let(:invalid_attributes) {
    { nickname: nil, make: 'DeLorean', model: 'XX', year: 1985, mileage: 30, purchase_date: '1985-07-03'}
  }

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @vehicles' do
      vehicles = Vehicle.all
      get :index
      expect(assigns(:vehicles)).to eq vehicles
    end
  end #describe 'GET index'

  describe 'GET new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'assigns @vehicle' do
      get :new
      expect(assigns(:vehicle)).to be_a_new Vehicle
    end
  end #describe 'GET new'

  describe 'GET show' do
    it 'has a 200 status code' do
      vehicle = Vehicle.create!(valid_attributes)
      get :show, id: vehicle
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      vehicle = Vehicle.create!(valid_attributes)
      get :show, id: vehicle
      expect(response).to render_template('show')
    end

    it 'assigns @vehicle' do
      vehicle = Vehicle.create!(valid_attributes)
      get :show, id: vehicle
      expect(assigns(:vehicle)).to eq vehicle
    end
  end #describe 'GET show'

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves a new vehicle' do
        expect {
          post :create, vehicle: valid_attributes
        }.to change(Vehicle, :count).by 1
      end

      it 'assigns @vehicle' do
        post :create, vehicle: valid_attributes
        expect(assigns(:vehicle)).to be_an Vehicle
        expect(assigns(:vehicle)).to be_persisted
      end

      it 'redirects to the created vehicle' do
        post :create, vehicle: valid_attributes
        expect(response).to redirect_to vehicles_path
      end
    end

    context 'with invalid attributes' do
      it 'assigns @vehicle, but does not save a new vehicle' do
        post :create, vehicle: invalid_attributes
        expect(assigns(:vehicle)).to be_a_new Vehicle
      end

      it 're-renders the new template' do
        post :create, vehicle: invalid_attributes
        expect(response).to render_template 'new'
      end
    end
  end #describe 'POST create'

  describe 'GET edit' do
    it 'has a 200 status code' do
      vehicle = Vehicle.create!(valid_attributes)
      get :edit, id: vehicle
      expect(response.status).to eq 200
    end

    it 'renders the edit template' do
      vehicle = Vehicle.create!(valid_attributes)
      get :edit, id: vehicle
      expect(response).to render_template('edit')
    end

    it 'assigns @vehicle' do
      vehicle = Vehicle.create!(valid_attributes)
      get :edit, id: vehicle
      expect(assigns(:vehicle)).to eq vehicle
    end
  end #describe 'GET edit'

  describe 'PATCH update' do
    context 'with valid attributes' do
      let(:new_attributes) {
        { nickname: 'Car New Attributes', make: 'Yugo', model: 'ZZ', year: 1981, mileage: 30000, purchase_date: '1982-09-30'}
      }

      it 'updates the requested vehicle' do
        vehicle = Vehicle.create!(valid_attributes)
        patch :update, id: vehicle, vehicle: new_attributes
        vehicle.reload
        expect(vehicle.nickname).to eq new_attributes[:nickname]
      end

      it 'assigns @vehicle' do
        vehicle = Vehicle.create!(valid_attributes)
        patch :update, id: vehicle, vehicle: new_attributes
        expect(assigns(:vehicle)).to eq vehicle
      end

      it 'redirects to the vehicle' do
        vehicle = Vehicle.create!(valid_attributes)
        patch :update, id: vehicle, vehicle: new_attributes
        expect(response).to redirect_to vehicle_path
      end
    end

    context 'with invalid attributes' do
      it 'assigns @vehicle' do
        vehicle = Vehicle.create!(valid_attributes)
        patch :update, id: vehicle, vehicle: invalid_attributes
        expect(assigns(:vehicle)).to eq vehicle
      end

      it 're-renders the edit template' do
        vehicle = Vehicle.create!(valid_attributes)
        patch :update, id: vehicle, vehicle: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end #describe 'PATCH update'

  describe 'DELETE destroy' do
    it 'destroys the requested vehicle' do
      vehicle = Vehicle.create!(valid_attributes)
      expect {
        delete :destroy, id: vehicle
      }.to change(Vehicle, :count).by(-1)
    end

    it 'redirects to the vehicles list' do
      vehicle = Vehicle.create!(valid_attributes)
      delete :destroy, id: vehicle
      expect(response).to redirect_to vehicles_path
    end
  end #describe 'DELETE destroy'

end
