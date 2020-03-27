feature 'authentication' do
  scenario 'user can sign in' do
    User.create(name: 'Liam Roberts', username: 'jalapeno', email: 'jalapeno@gmail.com', password: '123')
    visit('/')
    fill_in(:log_email, with: 'jalapeno@gmail.com')
    fill_in(:log_password, with: '123')
    click_button('Log In')
    expect(page).to have_content 'Welcome, Liam Roberts'
  end

  scenario 'user sees an error message if email doesnt exist' do
    User.create(name: 'Liam Roberts', username: 'jalapeno', email: 'jalapeno@gmail.com', password: '123')
    visit('/')
    fill_in(:log_email, with: 'jalapenooooo@gmail.com')
    fill_in(:log_password, with: '123')
    click_button('Log In')
    expect(page).to have_content 'Please check your email or password'
  end
  scenario 'user sees an error message if password is wrong' do
    User.create(name: 'Liam Roberts', username: 'jalapeno', email: 'jalapeno@gmail.com', password: '123')
    visit('/')
    fill_in(:log_email, with: 'jalapeno@gmail.com')
    fill_in(:log_password, with: '123456')
    click_button('Log In')
    expect(page).to have_content 'Please check your email or password'
  end
  scenario 'can sign out' do
    User.create(name: 'Liam Roberts', username: 'jalapeno', email: 'jalapeno@gmail.com', password: '123')
    visit('/')
    fill_in(:log_email, with: 'jalapeno@gmail.com')
    fill_in(:log_password, with: '123')
    click_button('Log In')
    click_button('Log Out')
    expect(page).not_to have_content 'Welcome, Liam Roberts'
  end

end
