# Cleaning the db
puts "Cleaning the db...."
puts "____________________________________________________________"

  User.destroy_all
  Track.destroy_all

# Create users
puts "Creating users..."
puts "____________________________________________________________"

users = [
  {email: 'alice@lewagon.org', first_name: 'Alice', last_name: 'F.', password: 'password'},
  {email: 'lauranne@lewagon.org', first_name: 'Lauranne', last_name: 'D.', password: 'password'},
  {email: 'victor@lewagon.org', first_name: 'Victor', last_name: 'G.', password: 'password'},
  {email: 'romain@lewagon.org', first_name: 'Romain', last_name: 'C.', password: 'password'},
  {email: "batman@lewagon.org", first_name: "Bruce", last_name: "Wayne", password: "password"}
]

users.size.times do |i|
  puts "User ##{i + 1}:"
  user = User.create!(users[i])
  i += 1
  # Render user details in the console
  puts "First name: #{user.first_name}"
  puts "Last name: #{user.last_name}"
  puts "Email: #{user.email}"
  puts "____________________________________________________________"
end

# Create tracks
puts "Creating tracks.."
puts "____________________________________________________________"

5.times do |i|
  track = Track.create!(
    title: Faker::Educator.course_name,
    description: Faker::Lorem.paragraph,
    creator_id: User.all.sample.id
    )
  puts "Track ##{i + 1}"
  puts "Title: #{track.title}"
  puts "Description: #{track.description}"
  puts "Creator: #{track.creator.first_name}"
  puts "____________________________________________________________"
end

# Create chapters
puts "Creating chapters..."
puts "____________________________________________________________"



# Create subscriptions
puts "Creating subscriptions..."
puts "____________________________________________________________"

Track.find_each do |t|
  n = rand(1...User.count)
  random_users = User.all.reject { |u| u == t.creator }.sample(n)
  random_users.each do |user|
    subscription = Subscription.create!(
      track: t,
      user: user
    )
  puts "#{subscription.user.first_name} subscribed to #{subscription.track.title}"
  puts "____________________________________________________________"
  end
end

puts "All done!"
