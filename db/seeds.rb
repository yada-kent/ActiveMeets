# テストユーザーを10人作成

# 10.times do |n|
#   User.find_or_create_by(email: "test#{n + 1}@gmail.com") do |user|
#     user.password = "123456"
#     user.password_confirmation = "123456"
#     user.name = "Test User #{n + 1}"
#   end
# end

# サンプルユーザーを検索または作成
YogaGoddess82 = User.find_or_create_by!(email: "YogaGoddess82@example.com") do |user|
  user.name = "YogaGoddess82"
  user.password = "123456"
  user.password_confirmation = "123456"
  user.introduction = "ヨガは私の情熱です。ポーズ、瞑想、呼吸法を通じて、心身の調和を追求しています。"
  # アバター画像を添付
  user.avatar.attach(io: File.open(Rails.root.join("db/fixtures/sample-user1.jpg")), filename: "sample-user1.jpg", content_type: "image/jpg")
end
FitFrank = User.find_or_create_by!(email: "FitFrank@example.com") do |user|
  user.name = "FitFrank"
  user.password = "123456"
  user.password_confirmation = "123456"
  user.introduction = "筋トレ中毒者！フィットネスを通じて人生を変えたいと思っています。毎日の進歩をシェアします！"
  # アバター画像を添付
  user.avatar.attach(io: File.open(Rails.root.join("db/fixtures/sample-user2.jpg")), filename: "sample-user2.jpg", content_type: "image/jpg")
end

RunAddictTom = User.find_or_create_by!(email: "RunAddictTom@example.com") do |user|
  user.name = "RunAddictTom"
  user.password = "123456"
  user.password_confirmation = "123456"
  user.introduction = "マラソンランナーで、自己改善エンスージアスト。足跡は私のストーリーです。新しいトレイルを探し続けます！！"
  # アバター画像を添付
  user.avatar.attach(io: File.open(Rails.root.join("db/fixtures/sample-user3.jpg")), filename: "sample-user3.jpg", content_type: "image/jpg")
end

HealthyHannah = User.find_or_create_by!(email: "HealthyHannah@example.com") do |user|
  user.name = "HealthyHannah"
  user.password = "123456"
  user.password_confirmation = "123456"
  user.introduction = "栄養とフィットネスのアドバイザー。健康的なレシピ、食事プラン、モチベーションのヒントを提供します！"
  # アバター画像を添付
  user.avatar.attach(io: File.open(Rails.root.join("db/fixtures/sample-user4.jpg")), filename: "sample-user4.jpg", content_type: "image/jpg")
end

LiftLife_Lisa = User.find_or_create_by!(email: "LiftLife_Lisa@example.com") do |user|
  user.name = "LiftLife_Lisa"
  user.password = "123456"
  user.password_confirmation = "123456"
  user.introduction = "重量挙げとストレングストレーニングが大好き。筋肉は新しいセクシーです💪！共に強くなりましょう"
  # アバター画像を添付
  user.avatar.attach(io: File.open(Rails.root.join("db/fixtures/sample-user5.jpg")), filename: "sample-user5.jpg", content_type: "image/jpg")
end


# サンプルの投稿を検索または作成
post = Post.find_or_create_by!(title: "朝の瞑想とヨガ", user: YogaGoddess82) do |new_post|
  new_post.body = "朝の太陽礼拝で一日をスタート。心と体の調和は、日々の実践から生まれます。平和と愛を込めて。"
  new_post.image.attach(io: File.open(Rails.root.join("db/fixtures/sample-post1.jpg")), filename: "sample-post1.jpg", content_type: "image/jpg")
end

post = Post.find_or_create_by!(title: "新記録達成！", user: FitFrank) do |new_post|
  new_post.body = "今日のレッグデイ、完了！スクワットとデッドリフト、新しいパーソナルベストを達成！💪 成長するためには、限界を押し上げなければならない。"
  new_post.image.attach(io: File.open(Rails.root.join("db/fixtures/sample-post2.jpg")), filename: "sample-post2.jpg", content_type: "image/jpg")
end

post = Post.find_or_create_by!(title: "新しいトレイルの冒険", user: RunAddictTom) do |new_post|
  new_post.body = "新しいトレイルを発見！息をのむような景色と共に15kmを走破。ランニングは自分を発見する旅。"
  new_post.image.attach(io: File.open(Rails.root.join("db/fixtures/sample-post3.jpg")), filename: "sample-post3.jpg", content_type: "image/jpg")
end

post = Post.find_or_create_by!(title: "ポストワークアウトの極上スムージー！", user: HealthyHannah) do |new_post|
  new_post.body = "新レシピアラート🥑💕: クリーミーなアボカドとカカオのスムージー！栄養豊富で美味しい、完璧なポストワークアウトスナック！"
  new_post.image.attach(io: File.open(Rails.root.join("db/fixtures/sample-post4.jpg")), filename: "sample-post4.jpg", content_type: "image/jpg")
end

post = Post.find_or_create_by!(title: "力強さの新記録！", user: LiftLife_Lisa) do |new_post|
  new_post.body = "ベンチプレスで新記録設立！どんな挑戦も、自信と決意があれば乗り越えられる！💪😊"
  new_post.image.attach(io: File.open(Rails.root.join("db/fixtures/sample-post5.jpg")), filename: "sample-post5.jpg", content_type: "image/jpg")
end


# 管理者を作成

Admin.find_or_create_by(email: 'admin@admin') do |admin|
  admin.password = '123456'
end

# デフォルトのタグを設定

default_tags = ['筋トレ', 'レッグデイ', 'ヨガ', 'ランニング', 'パワーリフティング', 'フィットネス']

default_tags.each do |tag_name|
  Tag.find_or_create_by(tag: tag_name)
end
