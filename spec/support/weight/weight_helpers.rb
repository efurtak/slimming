module WeightHelpers
  def add_weight_record(weight:)
    visit new_weight_record_path

    expect(page).to have_content('Choose date:')
    expect(page).to have_content('Current weight:')

    fill_in :weight_record_weight, with: weight

    click_on 'Create Weight record'

    expect(page).to have_selector('h1', text: 'Weight history')
    expect(page).to have_selector('td', text: weight)
  end
end