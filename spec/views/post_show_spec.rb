require 'rails_helper'

RSpec.describe 'Post', type: :system do
    describe 'show page' do
        it "I can see the post's title." do
        user = User.first
        post = user.post.first
        visit user_post_path(user, post)

        expect(page).to have_content(post.tile)
        end

        it "I can see who wrote the post." do
        user = User.first
        post = user.post.first
        visit user_post_path(user, post)

        expect(page).to have_content(user.name)
        end

        it "I can see how many comments it has." do
        user = User.first
        post = user.post.first
        visit user_post_path(user, post)

        expect(page).to have_content(post.comments_counter)
        end

        it "I can see how many likes it has." do
        user = User.first
        post = user.post.first
        visit user_post_path(user, post)

        expect(page).to have_content(post.likes_counter)
        end

        it "I can see the post body." do
        user = User.first
        post = user.post.first
        visit user_post_path(user, post)

        expect(page).to have_content(post.text)
        end

        it "I can see the username of each commentor." do
        user = User.first
        post = user.post.first
        comment = post.comments.first
        visit user_post_path(user, post)

        expect(page).to have_content(comment.author.name)
        end

        it "I can see the comment each commentor left." do
        user = User.first
        post = user.post.first
        comment = post.comments.first
        visit user_post_path(user, post)

        expect(page).to have_content(comment.text)
        end
    end
end