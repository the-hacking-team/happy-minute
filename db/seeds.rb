# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



HappyCode.destroy_all
HappyPrice.destroy_all
Item.destroy_all
Business.destroy_all
Owner.destroy_all
Customer.destroy_all
Administrator.destroy_all



businesses = Array.new
categories = ["Entrée", "Plat", "Dessert", "Soda", "Appéritif", "Boisson chaude", "Cocktail"]



1.times do
  password = Faker::Internet.password
  first = Faker::Name.first_name
  last  = Faker::Name.last_name
  email = Faker::Internet.username(specifier: "#{first} #{last}", separators: ['.']) + '@yopmail.com'
  Owner.create(first_name: first, last_name: last, email: email, password: password)
  puts email
end
puts "#{Owner.all.size} Owner created"


1.times do
  first = Faker::Name.first_name
  last  = Faker::Name.last_name
  password = Faker::Internet.password
  email = Faker::Internet.username(specifier: "#{first} #{last}", separators: ['.']) + '@yopmail.com'
  Customer.create(email: email, password: password)
  puts email
end
puts "#{Customer.all.size} Customer created"



1.times do 
  administrator = Administrator.create(email: "happy-minute-admin@yopmail.com", password: "happyminute")
  puts administrator.email
end 
puts "#{Administrator.all.size} Administrator created"




5.times do 
  business = Business.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone,
    photo: "http://placekitten.com/#{rand(150..200)}/#{rand(150..200)}",
    owner_id: Owner.first.id,
  )
  businesses << business
  puts businesses
end 
puts "#{Business.all.size} Businesses created"



10.times do 
  item = Item.create( 
    title: Faker::Food.dish,
    price: rand(1..50),
    available: true,
    description: Faker::Food.description,
    category: categories[rand(0..(categories.length-1))],
    photo: "http://placekitten.com/#{rand(150..200)}/#{rand(150..200)}",
    business_id: businesses[rand(0..(businesses.length-1))].id,
  )
  puts item
end 
puts "#{Item.all.size} Items created"


