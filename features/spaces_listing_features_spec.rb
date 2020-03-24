require 'pg'
require 'spec_helper'

feature 'spaces' do
    scenario 'shows an element from spaces Db correctly' do
      connection = PG.connect( dbname: 'makers_bnb_test')
      visit '/spaces'
      connection.exec("INSERT INTO spaces(name, description, price, date_from, date_to) VALUES ('42 Evergreen Terrace', 'semi-detached', 10, '2020-03-01', '2020-03-02');")
      expect(page).to have_content('42 Evergreen Terrace')
    end
end
  