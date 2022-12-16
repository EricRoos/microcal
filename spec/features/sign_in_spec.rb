# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'SignIns', type: :feature do
  scenario 'valid login' do
    user = User.create(username: 'test1', password: 'test123456')
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'test123456'
    click_on 'Log in'
  end
end
