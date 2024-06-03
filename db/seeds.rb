user = User.create name: 'John', email: 'Smith@mail.ru'
category = Category.create name: 'Ruby on Rails'

n = 0
50.times do
  Bulletin.create! title: "#{n}_bulletin", description: "good_#{n}",
    user_id: user.id, category_id: category.id
    n += 1
end
