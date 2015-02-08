require 'rails_helper'

RSpec.feature 'Managing welcome page' do
  scenario 'Display welcome page' do

    visit '/'
    expect(page).to have_content 'Welcome'
  end

end
