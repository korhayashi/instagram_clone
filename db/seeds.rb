50.times do |n|
  user_name = Faker::Internet.username
  email = Faker::Internet.email
  name = Faker::Games::Pokemon.name
  password = 'password'
  User.create!(name: name,
               email: email,
               user_name: user_name,
               password: password)
end
