require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates new user' do
      user = User.create(name: 'Liam Roberts', username: 'jalapeno', email: 'jalapeno@gmail.com', password: '123')
      persisted_data = persisted_data(table: 'users', id: user.id)
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.username).to eq 'jalapeno'
      expect(user.email).to eq 'jalapeno@gmail.com'
    end
  end

  describe '.find' do
    it 'finds by id' do
      user = User.create(name: 'Liam Roberts', username: 'jalapeno', email: 'jalapeno@gmail.com', password: '123')
      result = User.find(id: user.id )
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
      expect(result.name).to eq user.name
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(name: 'Liam Roberts', username: 'jalapeno', email: 'jalapeno@gmail.com', password: '123')
      authenticated_user = User.authenticate(email: 'jalapeno@gmail.com', password: '123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user = User.create(name: 'Liam Roberts', username: 'jalapeno', email: 'jalapeno@gmail.com', password: '123')
      expect(User.authenticate(email: 'jalapenoIII@gmail.com', password: '123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(name: 'Liam Roberts', username: 'jalapeno', email: 'jalapeno@gmail.com', password: '123')
      expect(User.authenticate(email: 'jalapeno@gmail.com', password: 'heyyyy')).to be_nil
    end
  end
end