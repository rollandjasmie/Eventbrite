# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
Event.destroy_all
Attandance.destroy_all

duration_tab = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
user=[]
event=[]

10.times do |i|
	user[i]=User.create!( first_name: Faker::Name.male_first_name,
						  last_name: Faker::Name.last_name,
						  email: "koto#{i}@yopmail.com",
						  password: Faker::Number.number(digits: 10),
						  description: Faker::Quote.matz) 
	puts "user"
end

10.times do |i|
 event << Event.create!(start_date: Faker::Time.forward(days: 31, period: :day),
 			duration: 50,  
 			title: Faker::Book.title,
 			description: Faker::Quote.matz,
 			price: rand(1..1000),
 			administre_id: user[rand(10)].id,
 			location: Faker::Address.city

 	)
 puts "event"

end

10.times do |i|
	attandance = Attandance.create!(
		stripe_customer_id: Faker::Code.imei,
		user_id: user[rand(10)].id ,
		event_id:event[rand(10)].id
		)
	puts "tendence"
end