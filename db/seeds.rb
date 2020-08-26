require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroy member"
Member.destroy_all
puts "destroy user"
User.destroy_all
puts "destroy cohort"
Cohort.destroy_all
puts "destroy receipts"
Receipt.destroy_all

# Users

puts "create user"
photo_1 = Dir[File.join(File.dirname(__FILE__), "../app/assets/images/val.jpg")].join
photo_2 = Dir[File.join(File.dirname(__FILE__), "../app/assets/images/jules.jpeg")].join
photo_3 = Dir[File.join(File.dirname(__FILE__), "../app/assets/images/yohan.jpg")].join
photo_4 = Dir[File.join(File.dirname(__FILE__), "../app/assets/images/mad.jpeg")].join

user_1 = User.new(email: 'valentin@gmail.com', password: 'mdpmdp', name: 'valentin')
user_1.avatar.attach(io: File.open(photo_1), filename: 'nes.png', content_type: 'image/png')
user_1.save!

user_2 = User.new(email: 'jules@gmail.com', password: 'mdpmdp', name: 'jules')
user_2.avatar.attach(io: File.open(photo_2), filename: 'nes.png', content_type: 'image/png')
user_2.save!

user_3 = User.new(email: 'yohan@gmail.com', password: 'mdpmdp', name: 'yohan')
user_3.avatar.attach(io: File.open(photo_3), filename: 'nes.png', content_type: 'image/png')
user_3.save!

user_4 = User.new(email: 'madeleine@gmail.com', password: 'mdpmdp', name: 'madeleine')
user_4.avatar.attach(io: File.open(photo_4), filename: 'nes.png', content_type: 'image/png')
user_4.save!

# Cogorts

puts "create cohort"

cohort_italy = Cohort.create!(
  title: "Holiday in Italy",
  description: "Groups for our holidays and remember our expenses.",
)

cohort_london = Cohort.create!(
  title: "Budget to London",
  description: "Expenses with Julio on London.",
)

member_cohort = Member.create!(
  status: 'owner',
  user_id: user_4.id,
  cohort_id: cohort_italy.id,
)

puts "#{Cohort.count}"

# receipts

receipt_1 = Receipt.create!(
  date: "2020 july 23",
  store: "La Famille",
  amount: 13,
  description: "Lunch at Le Wagon",
  category_name: "Restaurants",
  user_id: user_1.id,
)

receipt_2 = Receipt.create!(
  date: "2020 august 2",
  store: "Papa Rafaele",
  amount: 16,
  description: "Lunch at Le Wagon",
  category_name: "Restaurants",
  user_id: user_1.id,
)

receipt_3 = Receipt.create!(
  date: "2020 june 30",
  store: "Auchan",
  amount: 120,
  description: "Food shopping for this two weeks",
  category_name: "Food & Beverage shopping",
  user_id: user_1.id,
)

receipt_4 = Receipt.create!(
  date: "2020 july 29",
  store: "Decathlon",
  amount: 212,
  description: "New bike",
  category_name: "Shopping",
  user_id: user_1.id,
)

receipt_5 = Receipt.create!(
  date: "2020 june 23",
  store: "Bowling Fun",
  amount: 35,
  description: "Afterwork",
  category_name: "Entertainment",
  user_id: user_1.id,
)

receipt_6 = Receipt.create!(
  date: "2020 august 20",
  store: "Trainline",
  amount: 165,
  description: "Weekend in Milan",
  category_name: "Transports",
  user_id: user_1.id,
)

receipt_7 = Receipt.create!(
  date: "2020 june 28",
  store: "Maje",
  amount: 420,
  description: "shopping for the year",
  category_name: "Shopping",
  user_id: user_4.id,
)

receipt_8 = Receipt.create!(
  date: "2020 july 31",
  store: "Brilliant Costumes",
  amount: 45,
  description: "Costume for jules birthday",
  category_name: "Others",
  user_id: user_4.id,
)

receipt_9 = Receipt.create!(
  date: "2020 july 12",
  store: "Carrefour",
  amount: 30,
  description: "Gin for tonight",
  category_name: "Food & Beverage shopping",
  user_id: user_4.id,
)

receipt_10 = Receipt.create!(
  date: "2020 august 15",
  store: "Ryanair",
  amount: 90,
  description: "Weekend in Greece",
  category_name: "Transports",
  user_id: user_4.id,
)

receipt_11 = Receipt.create!(
  date: "2020 june 3",
  store: "UGC",
  amount: 8,
  description: "Tenet",
  category_name: "Entertainment",
  user_id: user_4.id,
)

receipt_12 = Receipt.create!(
  date: "2020 july 6",
  store: "Purifiq",
  amount: 5,
  description: "Toothpaste tabs",
  category_name: "Shopping",
  user_id: user_4.id,
)
