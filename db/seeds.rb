# !!! Seed must be create in order due to relationships
# Product, User, Project, Bid, Rating

##### Static Product Line #####
Product.create(
  option: "Basic Website",
  price: 500,
  duration: 21,
  description: "Build a beautiful, mobile friendly website to supercharge your business",
)
Product.create(
  option: "Ecommerce Website",
  price: 1000,
  duration: 28,
  description: "Build an online, 24/7 online shop to sell your services to new clients",
)
Product.create(
  option: "Blog Site",
  price: 200,
  duration: 10,
  description: "Build a blog to attract customers and build your expertise online",
)

##### Create Open projects 1-10 / users 1-20 with pending bids #####
10.times do |i|
  User.create(
    user_type: "client",
    email: "clientfull#{i}@mail.com",
    password: "password",
    name: "Client Joe",
    company_name: "Need Help Inc.",
    phone_number: 212345678,
    bio: "need lots of help, find me a dev",
    city: "Sydney",
  )
end
10.times do |i|
  User.create(
    user_type: "dev",
    email: "devfull#{i}@mail.com",
    password: "password",
    name: "Dev Jane",
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

10.times do
  Project.create(
    price: rand(300..1000),
    title: Faker::Appliance.brand,
    overview: Faker::Lorem.sentence(3),
    description: Faker::Lorem.paragraph(2),
    status: 0,
    user_id: rand(1..10),
    product_id: rand(1..3),
  )
end

50.times do
  Bid.create(
    status: 0,
    project_id: rand(1..10),
    user_id: rand(11..20),
  )
end

##### Create going projects 11-20 / user 21-40 with one accepted bid #####
devs = []
clients = []

10.times do |i|
  client = User.create(
    user_type: "client",
    email: "clientfull#{i + 10}@mail.com",
    password: "password",
    name: "Client Joe",
    company_name: "Need Help Inc.",
    phone_number: 212345678,
    bio: "need lots of help, find me a dev",
    city: "Sydney",
  )
  clients.push(client.id)
end

10.times do |i|
  dev = User.create(
    user_type: "dev",
    email: "devfull#{i + 10}@mail.com",
    password: "password",
    name: "Dev Jane",
    company_name: "Dev for You Inc.",
    phone_number: 287654321,
    bio: "I am ninja developer. Highly skilled in all areas of web development, you can count on me to get your projects done. I have over 3 years. I work along side my clients to understand exactly what they are looking for and deliver the right solution.
    My Skills include:
    Front-end: HTML, CSS, Bootstrap, JS
    Back-end: Ruby on Rails, NodeJS, Wordpress, Shopify
    Native English and excellent communication.",
    city: "Sydney",
  )
  devs.push(dev.id)
end

clients.each do |client_id|
  Project.create(
    price: rand(300..1000),
    title: Faker::Appliance.brand,
    overview: Faker::Lorem.sentence(3),
    description: Faker::Lorem.paragraph(2),
    deadline: Faker::Business.credit_card_expiry_date,
    status: 1,
    user_id: client_id,
    product_id: rand(1..3),
  )
end

# random rejected bids
50.times do
  Bid.create(
    status: 2,
    project_id: rand(11..20),
    user_id: rand(11..20),
  )
end

# one accepted bid per ongoing project
10.times do |i|
  Bid.create(
    status: 1,
    project_id: i + 10,
    user_id: devs[i - 1],
  )
end

##### Create completed projects 21-30 / user 41-60 with one accepted bid  / one rating per project #####
devs2 = []
clients2 = []
projects2 = []

10.times do |i|
  client = User.create(
    user_type: "client",
    email: "clientfull#{i + 20}@mail.com",
    password: "password",
    name: "Client Joe",
    company_name: "Need Help Inc.",
    phone_number: 212345678,
    bio: "need lots of help, find me a dev",
    city: "Sydney",
  )
  clients2.push(client.id)
end

10.times do |i|
  dev = User.create(
    user_type: "dev",
    email: "devfull#{i + 20}@mail.com",
    password: "password",
    name: "Dev Jane",
    company_name: "Dev for You Inc.",
    phone_number: 287654321,
    bio: "I am ninja developer. Highly skilled in all areas of web development, you can count on me to get your projects done. I have over 3 years. I work along side my clients to understand exactly what they are looking for and deliver the right solution.
    My Skills include:
    Front-end: HTML, CSS, Bootstrap, JS
    Back-end: Ruby on Rails, NodeJS, Wordpress, Shopify
    Native English and excellent communication.",
    city: "Sydney",
  )
  devs2.push(dev.id)
end

clients2.each do |client_id|
  project = Project.create(
    price: rand(300..1000),
    title: Faker::Appliance.brand,
    overview: Faker::Lorem.sentence(3),
    description: Faker::Lorem.paragraph(2),
    deadline: Faker::Business.credit_card_expiry_date,
    status: 2,
    user_id: client_id,
    product_id: rand(1..3),
  )
  projects2.push(project.id)
end

# random rejected bids
50.times do
  Bid.create(
    status: 2,
    project_id: rand(21..30),
    user_id: rand(11..20),
  )
end

# one accepted bid per ongoing project
10.times do |i|
  Bid.create(
    status: 1,
    project_id: i + 20,
    user_id: devs2[i - 1],
  )
end

# one rating per completed project
projects2.each do |project_id|
  Rating.create(
    project_id: project_id,
    rate: rand(5),
    testimony: Faker::Lorem.paragraph(2),
  )
end
