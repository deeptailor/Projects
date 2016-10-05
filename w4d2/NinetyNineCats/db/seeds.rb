# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(birth_date: "2015/01/29", color: "brown", name: "David", sex: "m", description: "playful, loyal, loves long walks on the beach")
Cat.create!(birth_date: "2011/12/25", color: "grey", name: "Frank", sex: "m", description: "al;eifjsl;ijefsf")
Cat.create!(birth_date: "1991/02/15", color: "white", name: "Fuzzy", sex: "f", description: "description")
Cat.create!(birth_date: "1960/02/03", color: "black", name: "Snugglz", sex: "f", description: "hates to snuggle")
Cat.create!(birth_date: "2014/05/01", color: "black", name: "Fluffee", sex: "m", description: "not fluffy")


CatRentalRequest.create!(cat_id: 1, start_date: "2016/10/01", end_date:"2016/11/01", status: "APPROVED")
CatRentalRequest.create!(cat_id: 2, start_date: "2016/10/15", end_date:"2016/11/01", status: "APPROVED")
CatRentalRequest.create!(cat_id: 3, start_date: "2016/10/01", end_date:"2016/11/01", status: "APPROVED")
CatRentalRequest.create!(cat_id: 4, start_date: "2016/10/01", end_date:"2016/11/01", status: "APPROVED")
CatRentalRequest.create!(cat_id: 5, start_date: "2016/10/01", end_date:"2016/11/01", status: "APPROVED")
