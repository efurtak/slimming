require 'rails_helper'

feature 'Add weight record' do
  scenario 'Successfully' do
    user_sign_up(first_name: 'Jan', last_name: 'Kowalski', email: 'jkowalski@example.com')

    visit new_weight_record_path

    expect(page).to have_content('Choose date:')
    expect(page).to have_content('Current weight:')

    fill_in :weight_record_weight, with: 120

    click_on 'Create Weight record'

    expect(page).to have_selector('h1', text: 'Weight history')
  end
end