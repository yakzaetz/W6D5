# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.destroy_all

# Users
starwars = Cat.create!(
  birth_date: "2015/01/20", 
  color: "black", 
  name: "Star Wars",
  sex: "M",
  description: "Adopted a long, long, time ago in a galaxy far, far away..." 
)

dog = Cat.create!(
  birth_date: "1900/01/05", 
  color: "brown", 
  name: "Dog",
  sex: "F",
  description: "Transferred from the ferry." 
)

oskar = Cat.create!(
  birth_date: "2011/08/01", 
  color: "orange", 
  name: "Oskar",
  sex: "M",
  description: "He's a jerk sometimes." 
)