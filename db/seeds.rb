# coding: utf-8

# ユーザ作成
User.create(
  email: 'test@user.com',
  name: Faker::Name.name,
  password: 'password'
)


# スレの作成
titles = <<~ECO
  10万円の使いみちに家庭で悲鳴
  【企業】ユニクロ、今夏マスク参入　高機能素材で通気性良く
  【日本】「パックマン」誕生から40周年　史上最も成功した業務用ゲーム機としてギネス世界記録[2020/05/22]
  コロナ自粛はいつまで続くのか？
  お米はハエヌキ派とコシヒカリ派どっち？
  目玉焼きに最適なのは醤油？ソース？塩？
  PS5の値段いくらになる？
  128円のワイのおつまみ
  多くのゲーマーの心を折った『超魔界村』をたった35分でクリア。激ムズのステージを難なく進むRTA動画を紹介
  【はやぶさ２】 帰還に向け最後のメインエンジン噴射開始
  毎日新聞世論調査】安倍内閣支持率27％（－13）　不支持率64％（＋19） ★10 [首都圏の虎★]
  冷凍食品は自然解凍OKじゃなくても食べて大丈夫？？
  3府県で自粛要請解除へ首都圏など継続
  ヤフー、HIKAKINと新型コロナ募金窓口を開設　医療従事者を支援
  3Dプリンタで作る人工呼吸器、経産省が補助金で支援
  プラレールが回転寿司に登場？！
ECO
titles = titles.split("\n")
titles.each do |content|
  Topic.create(title: content)
end


# レスの作成
topic_id_arr = Topic.pluck(:id).shuffle
topic_id_arr.each do |topic_id|
  res_count = rand(10..200)
  res_count.times do
    Response.create(
      topic_id: topic_id,
      token: SecureRandom.alphanumeric,
      name: '名無しさん',
      body: Faker::Lorem.sentence(word_count: rand(3..10))
    )
  end
end


# カテゴリの作成
category_count = 40
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
  i -= rand(2..10)*400
end
