# coding: utf-8

# ユーザ作成
User.create(
  email: 'test@user.com',
  name: Faker::Name.name,
  password: 'password'
)


# スレの作成
titles = %W(
  10万円の使いみちに家庭で悲鳴
  コロナ自粛はいつまで続くのか？
  お米はハエヌキ派とコシヒカリ派どっち？
  目玉焼きに最適なのは醤油？ソース？塩？
  PS5の値段いくらになる？
  冷凍食品は自然解凍OKじゃなくても食べて大丈夫？？
  3府県で自粛要請解除へ首都圏など継続
  ヤフー、HIKAKINと新型コロナ募金窓口を開設　医療従事者を支援
  3Dプリンタで作る人工呼吸器、経産省が補助金で支援
  プラレールが回転寿司に話題
)
titles.each do |content|
  Topic.create(title: content)
end


# レスの作成
topic_id_arr = Topic.pluck(:id)
300.times do |i|
  Response.create(
    topic_id: topic_id_arr.sample,
    token: SecureRandom.alphanumeric,
    name: "名無しさん#{i}",
    body: Faker::Lorem.sentence(word_count: rand(3..10))
  )
end


# カテゴリの作成
category_count = 30
Faker::Lorem.unique.clear
category_count.times do
  Category.create(name: Faker::Lorem.unique.word)
end
category_id_arr = Category.pluck(:id)


# スレにカテゴリの登録
topic_id_arr.each do |topic_id|
  arr = [*category_id_arr.sample(rand(4..25))]
  arr.each do |category_id|
    Categorization.create(
      topic_id: topic_id,
      category_id: category_id
    )
  end
end

t = Time.zone.now
i=10**5
Topic.all.map do |topic|
  topic.update(updated_at: t-(i*10).second)
  i -= rand(3..6)*1000
end
