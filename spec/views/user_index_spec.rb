require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'index page' do
    it 'I can see the username of all other users.' do
      users = User.all
      visit users_path
      expect(page).to have_content(users.first.name)
    end

    it 'I can see the profile picture for each user.' do
      visit users_path
      expect(page).to have_xpath("//img[@src='https://robohash.org/accusantiumeaquea.png?size=300x300&set=set1']")
    end

    it 'I can see the number of posts for each user has written.' do
      users = User.all
      visit users_path
      expect(page).to have_content(users.first.posts_counter)
    end

    it 'When I click on a user, I am redirected to that users show page.' do
      users = User.all
      visit users_path
      click_link(users.first.name)
      expect(page).to have_current_path(user_path(users.first.id))
    end
  end
end
