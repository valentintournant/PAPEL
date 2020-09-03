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
puts "destroy receipts"
Receipt.destroy_all
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

cohort_pau = Cohort.create!(
  title: "Budget to Pau",
  description: "Expenses with Julio in Pau.",
)

member_cohort = Member.create!(
  status: 'owner',
  user_id: user_4.id,
  cohort_id: cohort_italy.id,
)

member_cohort = Member.create!(
  status: 'owner',
  user_id: user_4.id,
  cohort_id: cohort_pau.id,
)

puts "#{Cohort.count}"

# receipts

receipt_1 = Receipt.create!(
  date: "2020 may 23",
  store: "La Famille",
  amount: 75,
  description: "Lunch at Le Wagon",
  category_name: "restaurant",
  user_id: user_4.id,
  address: "166 Bis Avenue de Bretagne, 59000 Lille",
)

receipt_2 = Receipt.create!(
  date: "2020 april 2",
  store: "Papa Rafaele",
  amount: 10,
  description: "Lunch at Le Wagon",
  category_name: "restaurant",
  user_id: user_4.id,
  address: "5 Rue Saint-Jacques, 59800 Lille",
)

receipt_3 = Receipt.create!(
  date: "2020 march 30",
  store: "Auchan",
  amount: 80,
  description: "Food shopping for this two weeks",
  category_name: "food_and_beverage",
  user_id: user_4.id,
  address: "14 Place Nouvelle Aventure, 59000 Lille",
)

receipt_4 = Receipt.create!(
  date: "2020 february 29",
  store: "Decathlon",
  amount: 20,
  description: "New bike",
  category_name: "shopping",
  user_id: user_4.id,
  address: "2 Rue des Tanneurs, 59000 Lille",
)

receipt_5 = Receipt.create!(
  date: "2020 january 23",
  store: "Bowling Fun",
  amount: 10,
  description: "Afterwork",
  category_name: "entertainment",
  user_id: user_4.id,
  address: "Z.A du Grand But, 8 Rue du Château d'Isenghien, 59160",
)

receipt_6 = Receipt.create!(
  date: "2020 september 20",
  store: "Trainline",
  amount: 60,
  description: "Weekend in Milan",
  category_name: "transport",
  user_id: user_4.id,
  address: "Rue de la Gare Lomme, 59160 Lomme",
)

receipt_7 = Receipt.create!(
  date: "2020 september 28",
  store: "Sandro",
  amount: 100,
  description: "shopping for the year",
  category_name: "shopping",
  user_id: user_4.id,
  address: "31 Rue du Faubourg de Béthune, 59000 Lille",
)

receipt_8 = Receipt.create!(
  date: "2020 september 25",
  store: "Brilliant Costumes",
  amount: 20,
  description: "Costume for jules birthday",
  category_name: "others",
  user_id: user_4.id,
  address: "139 Rue Léon Gambetta, 59000 Lille",
)

receipt_9 = Receipt.create!(
  date: "2020 may 12",
  store: "Carrefour",
  amount: 12,
  description: "Gin for tonight",
  category_name: "food_and_beverage",
  user_id: user_4.id,
  address: "59 Avenue de la République, 59160 Lille",
)

receipt_10 = Receipt.create!(
  date: "2020 april 15",
  store: "Ryanair",
  amount: 56,
  description: "Weekend in Greece",
  category_name: "transport",
  user_id: user_4.id,
  address: "1 rue Royale, 59000 Lille",
)

receipt_11 = Receipt.create!(
  date: "2020 march 3",
  store: "UGC",
  amount: 31,
  description: "Tenet",
  category_name: "entertainment",
  user_id: user_4.id,
  address: "40 Rue de Béthune, 59800 Lille",
)

receipt_12 = Receipt.create!(
  date: "2020 february 6",
  store: "Purifiq",
  amount: 50,
  description: "Toothpaste tabs",
  category_name: "shopping",
  user_id: user_4.id,
  address: "52 rue d'Angleterre, 59000 Lille",
)
receipt_13 = Receipt.create!(
  date: "2020 january 23",
  store: "La Famille",
  amount: 23,
  description: "Lunch at Le Wagon",
  category_name: "restaurant",
  user_id: user_4.id,
  address: "166 Bis Avenue de Bretagne, 59000 Lille",
)

receipt_14 = Receipt.create!(
  date: "2020 august 2",
  store: "Papa Rafaele",
  amount: 16,
  description: "Lunch at Le Wagon",
  category_name: "restaurant",
  user_id: user_4.id,
  address: "5 Rue Saint-Jacques, 59800 Lille",
)

receipt_15 = Receipt.create!(
  date: "2020 june 30",
  store: "Auchan",
  amount: 120,
  description: "Food shopping for this two weeks",
  category_name: "food_and_beverage",
  user_id: user_4.id,
  address: "14 Place Nouvelle Aventure, 59000 Lille",
)

receipt_16 = Receipt.create!(
  date: "2020 july 29",
  store: "Decathlon",
  amount: 212,
  description: "New bike",
  category_name: "shopping",
  user_id: user_4.id,
  address: "2 Rue des Tanneurs, 59000 Lille",
)

receipt_17 = Receipt.create!(
  date: "2020 june 23",
  store: "Bowling Fun",
  amount: 35,
  description: "Afterwork",
  category_name: "entertainment",
  user_id: user_4.id,
  address: "Z.A du Grand But, 8 Rue du Château d'Isenghien, 59160",
)

receipt_18 = Receipt.create!(
  date: "2020 august 20",
  store: "Trainline",
  amount: 165,
  description: "Weekend in Milan",
  category_name: "transport",
  user_id: user_4.id,
  address: "Rue de la Gare Lomme, 59160 Lomme",
)

receipt_19 = Receipt.create!(
  date: "2020 june 28",
  store: "Maje",
  amount: 420,
  description: "shopping for the year",
  category_name: "shopping",
  user_id: user_4.id,
  address: "31 Rue du Faubourg de Béthune, 59000 Lille",
)

receipt_20 = Receipt.create!(
  date: "2020 july 31",
  store: "Brilliant Costumes",
  amount: 45,
  description: "Costume for jules birthday",
  category_name: "others",
  user_id: user_4.id,
  address: "139 Rue Léon Gambetta, 59000 Lille",
)

receipt_21 = Receipt.create!(
  date: "2020 july 12",
  store: "Carrefour",
  amount: 30,
  description: "Gin for tonight",
  category_name: "food_and_beverage",
  user_id: user_4.id,
  address: "59 Avenue de la République, 59160 Lille",
)

receipt_22 = Receipt.create!(
  date: "2020 august 15",
  store: "Ryanair",
  amount: 90,
  description: "Weekend in Greece",
  category_name: "transport",
  user_id: user_4.id,
  address: "1 rue Royale, 59000 Lille",
)

receipt_23 = Receipt.create!(
  date: "2020 june 3",
  store: "UGC",
  amount: 8,
  description: "Tenet",
  category_name: "entertainment",
  user_id: user_4.id,
  address: "40 Rue de Béthune, 59800 Lille",
)

receipt_24 = Receipt.create!(
  date: "2020 july 6",
  store: "Purifiq",
  amount: 5,
  description: "Toothpaste tabs",
  category_name: "shopping",
  user_id: user_4.id,
  address: "52 rue d'Angleterre, 59000 Lille",
)

file = URI.open('https://res.cloudinary.com/dn3zpeebk/image/upload/v1598876244/3x75yc6enlhc14f61oq8tw697awo.png')

receipt_25 = Receipt.create!(
  date: "2020 august 31",
  store: "decathlon",
  amount: 21,
  description: "notre ticket test",
  category_name: "entertainment",
  user_id: user_4.id,
  address: "52 rue d'Angleterre, 59000 Lille",
)

receipt_25.photo.attach(io: file, filename: 'decathlon test', content_type: 'image/png')

