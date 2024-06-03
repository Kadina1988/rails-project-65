user = User.create name: 'Johni', email: 'Smith@mail.ru'
categories = %w[Ruby Ruby_on_Rails JavaScript Java]
all_cat = []

categories.each do |category|
  all_cat << Category.create(name: category)
end

fakes = [Faker::Food.allergen, Faker::Beer.name, Faker::Esport.event, Faker::Esport.player]

100.times do
  Bulletin.create(title: fakes[rand(0..3)], description: Faker::Movie.title,
    category_id: all_cat[rand(0..3)].id, user_id: user.id  )
end
