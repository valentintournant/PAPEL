# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroy user"
User.destroy_all
puts "destroy cohort"
Cohort.destroy_all

puts "create user"
user_1 = User.new(email: 'valentin@gmail.com', password: 'mdpmdp')
user_1.save!

user_2 = User.new(email: 'jules@gmail.com', password: 'mdpmdp')
user_2.save!

user_3 = User.new(email: 'yohan@gmail.com', password: 'mdpmdp')
user_3.save!

user_4 = User.new(email: 'madeleine@gmail.com', password: 'mdpmdp')
user_4.save!

puts "create cohort"
cohort = Cohort.create!(
  title: "Holiday in Italy",
  description: "Groups for our holidays and remember our expenses.",
  user: user_1,
)

cohort = Cohort.create!(
  title: "Budget to London",
  description: "Expenses with Julio on London.",
  user: user_2,
)

puts "#{Cohort.count}"
