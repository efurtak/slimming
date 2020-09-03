require 'rails_helper'

feature 'Create user' do
  scenario 'Successfully' do
    user_sign_up(first_name: 'Jan', last_name: 'Kowalski', email: 'jkowalski@example.com')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'Unsuccessfully, without first_name' do
    user_sign_up(first_name: '', last_name: 'Kowalski', email: 'jkowalski@example.com')
    expect(page).not_to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'Unsuccessfully, without last_name' do
    user_sign_up(first_name: 'Jan', last_name: '', email: 'jkowalski@example.com')
    expect(page).not_to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'Unsuccessfully, without email' do
    user_sign_up(first_name: 'Jan', last_name: 'Kowalski', email: '')
    expect(page).not_to have_content('Welcome! You have signed up successfully.')
  end
end