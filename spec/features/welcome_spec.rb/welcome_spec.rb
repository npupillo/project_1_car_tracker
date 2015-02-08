require 'rails_helper'

RSpec.feature 'Managing welcome page' do
  scenario 'Verify welcome page' do

    visit '/'

    expect(page).to have_content 'Welcome'
  end
end
