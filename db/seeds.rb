require 'faker'

10.times do
  List.create(
    title: Faker::Lorem.sentence
    )  
end
lists = List.all

5.times do
  Item.create(
    description: Faker::Lorem.sentence
    )
end

puts "Seed finished"
puts "#{List.count} lists created"
puts "#{Item.count} items created"