require 'rails_helper'

feature 'Log in user' do
  scenario 'Successfully' do
    user_sign_up(first_name: 'Jan', last_name: 'Kowalski', email: 'jkowalski@example.com')
    user_sign_out
    user_log_in(email: 'jkowalski@example.com')

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'Unsuccessfully' do
    user_sign_up(first_name: 'Jan', last_name: 'Kowalski', email: 'jkowalski@example.com')
    user_sign_out
    user_log_in(email: 'jkowalski@example.com', password: 'drowssap')

    expect(page).not_to have_content('Signed in successfully.')
  end
end