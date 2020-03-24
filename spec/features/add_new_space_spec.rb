feature 'adding new space' do
  scenario 'host can list their property' do
    visit('/spaces/new')
    fill_in('name', with: 'Beautiful space')
    fill_in('description', with: 'Beatiful spacious 2 bed apartment, 10 metres from the beach')
    click_button('Submit')
    expect(page).to have_content('Beautiful space')
  end
end