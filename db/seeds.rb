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
