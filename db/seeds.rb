# テストユーザーを10人作成

10.times do |n|
  User.find_or_create_by(email: "test#{n + 1}@gmail.com") do |user|
    user.password = "123456"
    user.password_confirmation = "123456"
    user.name = "Test User #{n + 1}"
  end
end

# 管理者を作成

Admin.find_or_create_by(email: 'admin@admin') do |admin|
  admin.password = '123456'
end

# デフォルトのタグを設定

default_tags = ['タグ1', 'タグ2', 'タグ3', 'タグ4', 'タグ5']

default_tags.each do |tag_name|
  Tag.find_or_create_by(tag: tag_name)
end
