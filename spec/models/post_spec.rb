require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
             posts_counter: 1)
  end

  let(:subject) do
    Post.new(author: user, title: 'Hello', text: 'This is my first posts', comments_counter: 2, likes_counter: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be less than or equal to 250 characters' do
    subject.title = 'A' * 251
    expect(subject).to_not be_valid
  end

  it 'comments counter should be an integer' do
    subject.comments_counter = 'not-numeric'
    expect(subject).to_not be_valid
  end

  it 'likes counter should be an integer' do
    subject.likes_counter = 'not-numeric'
    expect(subject).to_not be_valid
  end

  it 'comments should be greater than or equal to 0' do
    subject.comments_counter = -4
    expect(subject).to_not be_valid
  end

  it 'likes should be greater than or equal to 0' do
    subject.likes_counter = -2
    expect(subject).to_not be_valid
  end
end
