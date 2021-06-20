# 50.times do
#   user=User.new(
#     username: Faker::Internet.user_name,
#     email: Faker::Internet.email,
#     password: Faker::Internet.password
#   )
#   user.save!
# end

# 50.times do
#   tag=Tag.new(
#     name: Faker::Lorem.words(number: rand(1..3)).join(" ")
#   )
#   tag.save!
# end

# 50.times do
#   article=Article.new(
#     title: Faker::Lorem.unique.sentence(word_count: rand(3..10)),
#     content: Faker::Lorem.unique.paragraph(sentence_count: rand(5..15)),
#     user_id: rand(User.first.id..User.last.id)
#   )
#   article.tags = Tag.order(Arel.sql('RANDOM()')).first(rand(2..8))
#   article.save!
# end

# 500.times do
#   comment=Comment.new(
#     author_name: User.order(Arel.sql('RANDOM()')).first.username,
#     body: Faker::Lorem.unique.paragraph(sentence_count: rand(1..5)),
#     article_id: rand(Article.first.id..Article.last.id)
#   )
#   comment.save!
# end


