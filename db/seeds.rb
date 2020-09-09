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
categories = ["Entrée", "Plat", "Dessert", "Boisson", "Appéritif", "Boisson chaude"]



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
  administrator = Administrator.create ( 
    email: "happy-minute-admin@yopmail.com",
    password: "happyminute",
  )
end 


5.times do 
  business = Business.create(
    name: 
    address: 
    siret: 
    owner_id: Owner.first.id,
  )
  businesses << business
end 


10.times do 
  item = Item.create ( 
    title: 
    price:
    available: 
    description:
    category: 
    business_id: businesses[rand(0..(businesses.length - 1))].id,
  )
end 

