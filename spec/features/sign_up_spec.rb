feature 'sign up' do
  scenario 'user can sign up' do
    visit '/'
    fill_in('name', with: 'Liam Roberts')
    fill_in('username', with: 'jalapeno')
    fill_in('email', with: 'jalapeno@gmail.com')
    fill_in('password', with: '123')
    click_button('Submit')
    expect(page).to have_content 'Welcome, Liam Roberts!'
  end
end