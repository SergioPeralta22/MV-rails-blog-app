require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'show page' do
     it "I can see the user's profile picture." do
        user = User.first
        visit user_path(user)
        expect(page).to have_xpath("//img[@src='https://robohash.org/accusantiumeaquea.png?size=300x300&set=set1']")
    end

    it "I can see the user's username." do
        user = User.first
        visit user_path(user)
        
        expect(page).to have_content(user.name)
    end

    it "I can see the number of posts the user has written." do
        user = User.first
        visit user_path(user)
        
        expect(page).to have_content(user.posts_counter)
    end

    it "I can see the user's bio." do
        user = User.first
        visit user_path(user)
        
        expect(page).to have_content(user.bio)
    end

    it "I can see the user's first 3 posts." do
        user = User.first
        visit user_path(user)
        
        expect(page).to have_content(user.recent_posts)
    end

    it "I can see a button that lets me view all of a user's posts." do
        user = User.first
        visit user_path(user)
        
        assert_text 'See all posts'
    end

    it "When I click a user's post, it redirects me to that post's show page." do
        user = User.first
        visit user_path(user)
        click_on 'Post #1'
        
        expect(page).to have_current_path(user_post_path(user, user.posts.first))
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
        user = User.first
        visit user_path(user)
        click_on 'See all posts'
        
        expect(page).to have_current_path(user_posts_path(user))
    end
  end
end