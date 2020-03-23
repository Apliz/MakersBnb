require 'pg'
require 'spec_helper'

feature 'spaces' do
    scenario 'shows an element from spaces Db correctly' do
      connection = PG.connect( dbname: 'spaces')
      connection.exec("INSERT INTO spaces (id, name, description, price, date_from, date_to) VALUES (1, '42 Evergreen Terrace', 'Semi-Detatched', 1000, 2020-03-14, 2020-04-01);" )
      visit '/spaces'
      expect(page).to have_content('42 Evergreen Terrace')
    end
end
  