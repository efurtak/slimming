require 'rails_helper'

feature 'Calculate BMI' do
  scenario 'Successfully' do
    user_sign_up(first_name: 'Jan', last_name: 'Kowalski', email: 'jkowalski@example.com')

    account_set_height(height: 180)
    add_weight_record(weight: 85)

    visit bmi_path
    expect(page).to have_selector('h2', text: 'BMI:')
    expect(page).to have_selector('h2', text: '26.23')
  end

  scenario 'Unsuccessfully without height' do
    user_sign_up(first_name: 'Jan', last_name: 'Kowalski', email: 'jkowalski@example.com')

    add_weight_record(weight: 85)

    visit bmi_path
    expect(page).not_to have_selector('h2', text: 'BMI:')
    expect(page).to have_content('Please set Your height in Account page')
  end

  scenario 'Unsuccessfully without weight' do
    user_sign_up(first_name: 'Jan', last_name: 'Kowalski', email: 'jkowalski@example.com')

    account_set_height(height: 180)

    visit bmi_path
    expect(page).not_to have_selector('h2', text: 'BMI:')
    expect(page).to have_content('Please add at least one weight record')
  end
end