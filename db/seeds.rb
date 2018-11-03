# !!! Seed must be create in order due to relationships
# User, Product, Project, Bid, Rating

20.times do |i|
  User.create(
    user_type: "client",
    email: "clientfull#{i}@mail.com",
    password: "password",
    name: "Client Full Profile",
    company_name: "Need Help Inc.",
    phone_number: 212345678,
    bio: "need lots of help, find me a dev",
    city: "Sydney",
  )
end

1.times do |i|
  User.create(
    user_type: "client",
    email: "clientpart#{i}@mail.com",
    password: "password",
  )
end

5.times do |i|
  User.create(
    user_type: "dev",
    email: "devpart#{i}@mail.com",
    password: "password",
  )
  User.create(
    user_type: "dev",
    email: "devfull#{i}@mail.com",
    password: "password",
    name: "Dev Full Profile",
    company_name: "Dev for You Inc.",
    phone_number: 287654321,
    bio: "ninja dev, skilled in all tech",
    city: "Sydney",
  )
end

Product.create(
  option: "Simple Website",
  price: 300,
  duration: 7,
)
Product.create(
  option: "Simple eCommerce Site",
  price: 1000,
  duration: 14,
)
Product.create(
  option: "Basic Blog Site",
  price: 500,
  duration: 10,
)

20.times do |x|
  Project.create(
    title: Faker::Appliance.brand,
    overview: Faker::Lorem.sentence(3),  
    description: Faker::Lorem.paragraph(2),
    product_id: rand(4),
    deadline: Faker::Business.credit_card_expiry_date,
    user_id: 4,
    price: Faker::Commerce.price
  )
end
