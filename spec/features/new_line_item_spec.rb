require 'rails_helper'

RSpec.feature "NewLineItems", type: :feature do
  scenario 'successfully create new line item', js: true do
    user = sign_in
    within_aria Date.today.strftime('%m/%d') do
      fill_in('Line Item Title', with: 'new item')
    end
  end
end
