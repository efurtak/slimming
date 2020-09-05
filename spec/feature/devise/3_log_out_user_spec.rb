require 'rails_helper'

feature 'Log out user' do
  scenario 'Successfully' do
    user_sign_up(first_name: 'Jan', last_name: 'Kowalski', email: 'jkowalski@example.com')
    user_sign_out
    user_log_in(email: 'jkowalski@example.com')
    user_sign_out

    expect(page).to have_content('Signed out successfully.')
  end
end