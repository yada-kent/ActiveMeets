10.times do |n|
  User.create!(
    email: "test#{n + 1}@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    name: "Test User #{n + 1}"
  )
end

# テストユーザーを10人作成

Admin.create!(
   email: 'admin@admin',
   password: '123456'
)

# 管理者を作成
