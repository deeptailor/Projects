# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(username: "frank")
User.create!(username: "deep")
User.create!(username: "somebody")
User.create!(username: "gonna")
User.create!(username: "get")
User.create!(username: "hurt")
User.create!(username: "real")
User.create!(username: "bad")

Contact.create!(name: "franklin",email: "123@gmail.com",user_id: 1)
Contact.create!(name: "russell",email: "345@gmail.com",user_id: 2)
Contact.create!(name: "peters",email: "678@gmail.com",user_id: 3)
Contact.create!(name: "gilbert",email: "987@gmail.com",user_id: 4)
Contact.create!(name: "gottfried",email: "654@gmail.com",user_id: 5)
Contact.create!(name: "andrew",email: "321@gmail.com",user_id: 6)
Contact.create!(name: "peanuts",email: "000@gmail.com",user_id: 7)
Contact.create!(name: "snuggles",email: "999@gmail.com",user_id: 8)

ContactShare.create(user_id:1 ,contact_id: 8)
ContactShare.create(user_id:2 ,contact_id: 7)
ContactShare.create(user_id:3 ,contact_id: 6)
ContactShare.create(user_id:4 ,contact_id: 5)
ContactShare.create(user_id:5 ,contact_id: 4)
ContactShare.create(user_id:6 ,contact_id: 3)
ContactShare.create(user_id:7 ,contact_id: 2)
ContactShare.create(user_id:8 ,contact_id: 1)
