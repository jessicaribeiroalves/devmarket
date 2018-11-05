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

# 1.times do |i|
#   User.create(
#     user_type: "client",
#     email: "clientpart#{i}@mail.com",
#     password: "password",
#   )
# User.create(
#   user_type: "dev",
#   email: "devpart#{i}@mail.com",
#   password: "password",
# )
# end

20.times do |i|
  User.create(
    user_type: "dev",
    email: "devfull#{i}@mail.com",
    password: "password",
    name: "Dev Full Profile",
    company_name: "Dev for You Inc.",
    phone_number: 287654321,
    bio: "I am ninja developer. Highly skilled in all areas of web development, you can count on me to get your projects done. I have over 3 years. I work along side my clients to understand exactly what they are looking for and deliver the right solution.
    My Skills include:
    Front-end: HTML, CSS, Bootstrap, JS
    Back-end: Ruby on Rails, NodeJS, Wordpress, Shopify
    Native English and excellent communication.",
    city: "Sydney",
  )
end

Product.create(
  option: "Simple Website",
  price: 300,
  duration: 7,
  description: "Simple Website",
)
Product.create(
  option: "Simple eCommerce Site",
  price: 1000,
  duration: 14,
  description: "Simple eCommerce Site",
)
Product.create(
  option: "Basic Blog Site",
  price: 500,
  duration: 10,
  description: "Basic Blog Site",
)

10.times do
  Project.create(
    price: rand(300..1000),
    title: Faker::Appliance.brand,
    overview: Faker::Lorem.sentence(3),
    description: Faker::Lorem.paragraph(2),
    deadline: Faker::Business.credit_card_expiry_date,
    status: 0,
    user_id: rand(21..40), #FIXME should be client types
    product_id: rand(1..3),
  )
end
10.times do
  Project.create(
    price: rand(300..1000),
    title: Faker::Appliance.brand,
    overview: Faker::Lorem.sentence(3),
    description: Faker::Lorem.paragraph(2),
    deadline: Faker::Business.credit_card_expiry_date,
    status: 1,
    user_id: rand(21..40), #FIXME should be client types
    product_id: rand(1..3),
  )
end
10.times do
  Project.create(
    price: rand(300..1000),
    title: Faker::Appliance.brand,
    overview: Faker::Lorem.sentence(3),
    description: Faker::Lorem.paragraph(2),
    deadline: Faker::Business.credit_card_expiry_date,
    status: 2,
    user_id: rand(21..40), #FIXME should be client types
    product_id: rand(1..3),
  )
end

50.times do
  Bid.create(
    status: 0,
    project_id: rand(1..10),
    user_id: rand(21..40),
  )
end
50.times do
  Bid.create(
    status: 0,
    project_id: rand(11..20),
    user_id: rand(21..40),
  )
end
50.times do
  Bid.create(
    status: 0,
    project_id: rand(21..30),
    user_id: rand(21..40),
  )
end
