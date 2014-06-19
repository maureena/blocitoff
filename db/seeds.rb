require 'faker'

3.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10) 
  )
  user.skip_confirmation!
  user.save
end
users = User.all

10.times do
  List.create(
    user: users.sample,
    title: Faker::Lorem.sentence
  )  
end
lists = List.all

5.times do
  Item.create(
    list: lists.sample,
    description: Faker::Lorem.sentence
  )
end
items = Item.all

User.first.update_attributes(
  email: 'maureen.adamo@gmail.com',
  password: 'helloworld',
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"