# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'dotenv'
# require 'json'
Dotenv.load

response = RestClient.get('https://api.thecatapi.com/v1/breeds')
breeds_array = JSON.parse(response)
breeds_array.each do |breed|
   Cat.create(name: breed["name"], origin: breed["origin"], description: breed["description"])
end
