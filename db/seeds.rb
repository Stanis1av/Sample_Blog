50.times do
  user=User.new(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
end

50.times do
  tag=Tag.new(
    name: Faker::Lorem.words(number: rand(1..3)).join(" ")
  )
  tag.save!
end

50.times do
  post=Post.new(
    title: Faker::Lorem.unique.sentence(word_count: rand(3..10)),
    content: Faker::Lorem.unique.paragraph(sentence_count: rand(5..15)),
    user_id: rand(User.first.id..User.last.id)
  )
  post.tags = Tag.order(Arel.sql('RANDOM()')).first(rand(2..8))
  post.save!
end

500.times do
  comment=Comment.new(
    author_name: User.order(Arel.sql('RANDOM()')).first.username,
    body: Faker::Lorem.unique.paragraph(sentence_count: rand(1..5)),
    post_id: rand(Post.first.id..Post.last.id)
  )
  comment.save!
end


