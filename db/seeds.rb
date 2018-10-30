# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.times do |i|
  User.create(
    user_type: "client",
    email: "clientpart#{i}@mail.com",
    password: "password",
  )
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
