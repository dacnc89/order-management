puts "Destroy old data!"
Order.destroy_all
User.destroy_all

# create admin user
puts "Creating users, orders..."
User.create(first_name: 'Admin', last_name: 'John', email: 'admin@email.com', is_admin: true, password: 'password', password_confirmation: 'password')

# create users, orders
(1..100).to_a.each do |i|
  user = User.new(first_name: 'User', last_name: "L#{i}", email: "user-l#{i}@email.com", password: 'password', password_confirmation: 'password')
  user.save!
  (1..10).to_a.each do |j|
    user.orders.create(status: Order.statuses.keys.sample.to_s, total: [100, 200, 500, 1000, 1200, 1500, 2000].sample, ship_to: ['Ha Noi', 'Ho Chi Minh', 'Da Nang'].sample)
  end
end
