require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'show page' do
     it "I can see the user's profile picture." do
        user = User.first
        visit user_path(user)
        expect(page).to have_xpath("//img[@src='https://robohash.org/accusantiumeaquea.png?size=300x300&set=set1']")
     end
    end
  end
end