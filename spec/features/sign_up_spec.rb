# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'SignUps', type: :feature do
  scenario 'valid registration' do
    visit new_user_registration_path
    fill_in 'Username', with: 'newuser'
    fill_in 'Password', with: 'test123456'
    fill_in 'Password confirmation', with: 'test123456'
    click_on 'Sign up'
  end
end
