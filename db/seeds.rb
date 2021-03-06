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
Category.destroy_all

# OWNER
# For use in tests
Owner.create(first_name: 'owner', last_name: 'name', email: 'happy-minute-owner@yopmail.com', password: 'happyminute')
# With Faker
2.times do
  password = Faker::Internet.password
  first = Faker::Name.first_name
  last  = Faker::Name.last_name
  email = Faker::Internet.username(specifier: "#{first} #{last}", separators: ['.']) + '@yopmail.com'
  Owner.create(first_name: first, last_name: last, email: email, password: password)
  puts email
end
puts "#{Owner.all.size} Owner created"

# CUSTOMER
# For use in tests
Customer.create(first_name: 'customer', last_name: 'name', email: 'happy-minute-customer@yopmail.com', password: 'happyminute')
# With Faker
2.times do
  first = Faker::Name.first_name
  last  = Faker::Name.last_name
  password = Faker::Internet.password
  email = Faker::Internet.username(specifier: "#{first} #{last}", separators: ['.']) + '@yopmail.com'
  Customer.create(first_name: first, last_name: last, email: email, password: password)
  puts email
end
puts "#{Customer.all.size} Customer created"

# ADMINISTRATOR
# For use in tests
Administrator.create(email: 'happy-minute-admin@yopmail.com', password: 'happyminute')
puts "#{Administrator.all.size} Administrator created"

# French business addresses
Faker::Config.locale = 'fr'

# BUSINESSES
# With Faker (each owner has at least 2 businesses)
Owner.all.each do |owner|
  rand(2..4).times do
    Business.create(
      name: Faker::Restaurant.name,
      address: Faker::Address.full_address,
      phone: Faker::PhoneNumber.cell_phone,
      owner_id: owner.id
    )
  end
end
puts "#{Business.all.size} Businesses created"

# CATEGORY
# Hand-written by Administrator
categories = ['Entrée', 'AntiPasti', 'Plat', 'Dessert', 'Soda', 'Apéritif', 'Boisson chaude', 'Cocktail']
j = 0

categories.each do |category|
  Category.create(
    name: category,
    position: j += 1
  )
end
puts "#{Category.all.size} Categories created"

# ITEMS
# With Faker (each business has at least 3 items)
i = 0
Business.all.each do |business|
  rand(3..6).times do
    Item.create(
      title: Faker::Food.dish,
      price: rand(1..50),
      available: true,
      description: Faker::Food.description,
      business_id: business.id,
      position: i += 1,
      category_id: Category.all.sample.id
    )
  end
end
puts "#{Item.all.size} Items created"
