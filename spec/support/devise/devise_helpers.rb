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
  
end