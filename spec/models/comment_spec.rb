require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                posts_counter: 1)
  end

  let(:post) do
    Post.create(author: user, title: 'Hello', text: 'This is my first posts', comments_counter: 0, likes_counter: 0)
  end

  let(:subject) do
    Comment.new(author: user, post:, text: 'Great posts!')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'belongs to an author' do
    expect(subject.author).to eq(user)
  end

  it 'belongs to a posts' do
    expect(subject.post).to eq(post)
  end

  it 'updates comments counter on posts after save' do
    expect { subject.save }.to change { post.reload.comments_counter }.by(1)
  end
end
