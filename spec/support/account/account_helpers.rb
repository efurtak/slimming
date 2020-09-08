module AccountHelpers
  def account_set_height(height:)
    visit root_path
    click_link 'Account'
    click_on 'Edit user'
    fill_in 'user_height', with: height
    click_on 'Update User'
    expect(page).to have_selector('p', text: 'Height: ' + height.to_s + ' cm')
  end
end