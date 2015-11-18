# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Clearing the database:"
puts "\tDeleting users..."
User.delete_all
puts "\tDeleting billing_infos..."
BillingInfo.delete_all
puts "\tDeleting payment_details..."
PaymentDetail.delete_all
puts "\tDeleting items..."
Item.delete_all
puts "\tDeleting auctions..."
Auction.delete_all
puts "Done!"

puts "\nCreating admin: admin@admin.com\nPassword: 1234"
admin = Admin.create!({
  username: 'admin@admin.com',
  password: '1234',
  password_confirmation: '1234'
  })

puts "\nCreating user: a@b.org\nPassword: 1234"
v = User.create!({
  username: 'a@b.org',
  password: '1234',
  password_confirmation: '1234'
  })

puts "\tCreating billing_info for a@b.org..."
b = BillingInfo.create!({
  name: "James Ferrier",
  street_address: "1000 Address Street",
  city: "Valdosta",
  state: "GA",
  zip: "31602",
  phone_number: "2222222222",
  email_address: "a@b.org"
  })

puts "\tCreating payment_detail for a@b.org..."
p = PaymentDetail.create!({
  credit_card: false,
  credit_card_number: nil,
  credit_card_expiration_date: nil,
  credit_card_security_code: nil,
  paypal: true,
  paypal_email_address: 'a@b.org',
  })

puts "\t\tAttaching billing_info to payment_detail"
p.billing_info = b
p.save!
puts "\t\tAttaching payment_detail to a@b.org"
v.payment_details << p
v.save!

puts "\nCreating user: a@b.com\nPassword: 1234"
u = User.create!({
  username: 'a@b.com',
  password: '1234',
  password_confirmation: '1234'
  })

puts "\tCreating item: 'Rad Motorcycle'..."
i = Item.create({
  headline_image: File.new("#{Rails.root}/Resources/Motor_Bike_Self_Portrait.jpg"),
  name: "Rad Motorcycle",
  description: "I didn't have my phone, so I drew this rad image of me and my motorcycle. You can tell I'm going pretty fast because my sunglasses.",
  starting_price: 10.0,
  buyout_price: 150.0,
  street_address: "404 Page Not Found St",
  city: "HTTP",
  state: "GA",
  zip: "31111",
  delivered: false
  })

puts "\tCreating auction for item: 'Rad Motorcycle'..."
a = Auction.create({
  begin_date: (DateTime.now - 1.day).beginning_of_day,
  end_date: DateTime.now.beginning_of_day,
  current_bid: 212.96,
  bidder_id: v.id,
  flagged: false,
  paid: false
  })

puts "\t\tAttaching auction to item..."
i.auction = a
i.save!
puts "\t\tAttaching item to a@b.com..."
u.items << i
u.save!

puts "\tCreating item: 'Super Cool Barbie Dolls'..."
i = Item.create({
  headline_image: File.new("#{Rails.root}/Resources/Barbies.jpg"),
  name: "Super Cool Barbie Dolls",
  description: "My daughter is turning 30, so I'm selling her toys. She needs to get out more! 15$ each, set of 200",
  starting_price: 3000.0,
  buyout_price: 4000.0,
  street_address: "200 OK St",
  city: "HTTP",
  state: "GA",
  zip: "32222",
  delivered: false
  })

puts "\tCreating auction for item: 'Super Cool Barbie Dolls'..."
a = Auction.create({
    begin_date: DateTime.now.beginning_of_day,
    end_date: (DateTime.now + 1.day).beginning_of_day,
    current_bid: 3000.00,
    bidder_id: v.id,
    flagged: false,
    paid: false
  })

puts "\t\tAttaching auction to item..."
i.auction = a
i.save!
puts "\t\tAttaching item to a@b.com..."
u.items << i
u.save!

puts "\tCreating item: 'Rare Exploding Dog'..."
i = Item.create({
  headline_image: File.new("#{Rails.root}/Resources/Explosion.jpg"),
  name: "Rare Exploding Dog",
  description: "May have already exploded*",
  starting_price: 1.0,
  buyout_price: 15.0,
  street_address: "302 Redirected St",
  city: "HTTP",
  state: "GA",
  zip: "33333",
  delivered: false
  })

puts "\tCreating auction for item: 'Rare Exploding Dog'..."
a = Auction.create({
    begin_date: (DateTime.now + 1.day).beginning_of_day,
    end_date: (DateTime.now + 2.days).beginning_of_day,
    current_bid: 212.96,
    bidder_id: v.id,
    flagged: false,
    paid: false
  })

puts "\t\tAttaching auction to item..."
i.auction = a
i.save!
puts "\t\tAttaching item to a@b.com..."
u.items << i
u.save!