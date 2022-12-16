# frozen_string_literal: true

module SignInHelper
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'test123456'
    click_on 'Log in'
  end
end
