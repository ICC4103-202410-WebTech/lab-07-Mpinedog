# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
PostTag.delete_all
Post.delete_all
User.delete_all
Tag.delete_all

5.times do |i|
  user = User.create(
    name: "User#{i + 1}",
    email: "user#{i + 1}@example.com",
    password: "password"
  )

  if user.persisted?
    post = user.posts.create(
      title: "Post Title #{i + 1}",
      content: "Post content for User#{i + 1}'s post."
    )

    tag = Tag.create(name: "Tag#{i + 1}")
    post.tags << tag
  else
    puts "User creation failed for User#{i + 1}"
  end
end

5.times do |i|
  post = Post.create(
    title: "Additional Post Title #{i + 1}",
    content: "Additional post content for Post#{i + 6}."
  )

  tag = Tag.create(name: "Tag#{i + 6}")
  post.tags << tag
end

Post.all.each_with_index do |post, i|
  tag = Tag.create(name: "Tag#{i + 11}")
  post.tags << tag
end
