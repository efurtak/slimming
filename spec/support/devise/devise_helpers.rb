module DeviseHelpers

  def user_sign_up(first_name:, last_name:, email:)
    visit new_user_registration_path

    fill_in 'user_first_name', with: first_name
    fill_in 'user_last_name', with: last_name
    fill_in 'user_email', with: email
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'

    click_on 'Sign up'
  end

  def user_sign_out
    visit root_path
    click_on 'Sign out'
  end

  def user_log_in(email:, password: 'password')
    visit new_user_session_path

    fill_in 'user_email', with: email
    fill_in 'user_password', with: password

    within('div.actions') do
      click_on 'Log in'
    end
  end
  
end