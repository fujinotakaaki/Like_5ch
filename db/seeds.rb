# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  email: 'test@user.com',
  name: 'test_user',
  password: 'password'
)

titles = %w(
  10万円の使いみち 家庭で悲鳴
  コロナ自粛はいつまで続くのか？
  お米はハエヌキ派とコシヒカリ派どっち？
  目玉焼きに最適なのは醤油？ソース？塩？
  PS5の値段いくらになる？
  冷凍食品は自然解凍OKじゃなくても食べて大丈夫？？
  3府県で解除へ首都圏など継続
)
titles.each do |content|
  Topic.create(title: content)
end

ids = Topic.pluck(:id)
100.times do |i|
  Response.create(
    topic_id: ids.sample,
    token: SecureRandom.alphanumeric,
    name: "名無しさん#{i}",
    body: SecureRandom.alphanumeric,
  )
end

categories = %w(
  ゲーム
  調理
  パソコン
  家具
  受験
  就職
  コロナ
  安倍晋三
)
categories.each do |content|
  Category.create(name: content)
end

Category.pluck(:id).each do |category_id|
  Categorization.create(
    topic_id: ids.sample,
    category_id: category_id
  )
end
