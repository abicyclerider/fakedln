# Clear existing data
puts "Clearing existing data..."
Post.destroy_all
User.destroy_all

puts "Creating users..."
# Create 10 users with realistic data
10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "password123",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    headline: Faker::Job.title,
    location: "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
    bio: Faker::Lorem.paragraph(sentence_count: 3)
  )
end

puts "Creating posts..."
# Create 20-30 posts from random users
users = User.all
rand(20..30).times do
  Post.create!(
    user: users.sample,
    content: Faker::Lorem.paragraph(sentence_count: rand(2..5))
  )
end

puts "Seed data created!"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "\nYou can sign in with any user's email and password: password123"
