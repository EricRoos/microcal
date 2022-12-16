# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'SignIns', type: :feature do
  scenario 'valid login' do
    user = User.create(username: 'test1', password: 'test123456')
    sign_in(user)
  end
end
