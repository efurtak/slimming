require 'rails_helper'

feature 'add shoe through activeadmin console' do
  scenario 'Successfully' do
    AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.test?
    
    visit new_admin_user_session_path

    fill_in 'admin_user_email', with: 'admin@example.com'
    fill_in 'admin_user_password', with: 'password'

    click_on 'Login'

    expect(page).to have_content('Signed in successfully.')

    within('#shoes') do
      click_link 'Shoes'
    end

    expect(page).to have_selector('h2', text: 'Shoes')

    click_link 'New Shoe'

    expect(page).to have_selector('h2', text: 'Create new shoe')

    page.attach_file('shoe_thumbnail', Rails.root.join('app', 'assets', 'images', 'thumbnail_for_tests.jpeg'))
    fill_in 'shoe_name', with: 'Nike Metcon 4 ID'
    fill_in 'shoe_price', with: 599

    click_on 'Create Shoe'

    expect(page).to have_content('Shoe was successfully created.')

    user_sign_up(first_name: 'Jan', last_name: 'Kowalski', email: 'jkowalski@example.com')

    visit shoes_path

    expect(page).to have_selector('a', text: 'Nike Metcon 4 ID')
    expect(page).to have_selector('td', text: '599')
  end
end