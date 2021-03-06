feature 'adding new space' do
  scenario 'host can list their property' do
    visit '/'
    fill_in('name', with: 'Liam Roberts')
    fill_in('username', with: 'jalapeno')
    fill_in('email', with: 'jalapeno@gmail.com')
    fill_in('password', with: '123')
    click_button('Submit')

    visit('/spaces/new')
    fill_in('name', with: 'Beautiful space')
    fill_in('description', with: 'Beatiful spacious 2 bed apartment, 10 metres from the beach')
    fill_in('price', with: 10)
    fill_in('date_from', with: '2020-03-15')
    fill_in('date_to', with: '2020-04-15')
    click_button('Submit')

    expect(page).to have_content('Beautiful space')
  end
end
