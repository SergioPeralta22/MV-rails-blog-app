# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

10.times do
  User.create(
    name: Faker::Name.name,
    photo: Faker::Avatar.image,
    bio: Faker::Lorem.paragraph,
    posts_counter: 0
  )
end

users = User.all

users.each do |user|
  10.times do
    Post.create(
      title: Faker::Book.title,
      text: Faker::Lorem.paragraphs(number: 3).join("\n\n"),
      comments_counter: 0,
      likes_counter: 0,
      author_id: user.id
    )
  end
end

posts = Post.all

posts.each do |post|
  5.times do
    Comment.create(
      text: Faker::Lorem.sentence,
      created_at: Faker::Time.between(from: post.created_at, to: DateTime.now),
      updated_at: Faker::Time.between(from: post.created_at, to: DateTime.now),
      author_id: users.sample.id,
      post_id: post.id
    )
  end
end