require 'pg'
require 'spec_helper'

feature 'spaces' do
    scenario 'shows an element from spaces Db correctly' do
      Space.create(name: '14 Blue Lane', description: 'semi-detached', price: 14, date_from: '2020-03-01', date_to: '2020-03-20')
      Space.create(name: '1 Red Lane', description: 'apartment', price: 14, date_from: '2020-03-01', date_to: '2020-03-20')

      visit '/spaces'
       
      expect(page).to have_content('14 Blue Lane')
      expect(page).to have_content('1 Red Lane')

    end
end
