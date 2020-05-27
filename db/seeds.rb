# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Trip.destroy_all
puts 'trip destroyed'
User.destroy_all
puts 'user destroyed'
User.create!(
    email: "astrid@mail.com",
    password: "123456"
)
User.create!(
    email: "harold@mail.com",
    password: "123456"
)
User.create!(
    email: "emmanuelle@mail.com",
    password: "123456"
)
User.create!(
    email: "wila@mail.com",
    password: "123456"
)
Restaurant.create!(
  name: "Maman sardine",
  address: 'Marseille',
  description: "La délice des Sardines à Marseille",
  category: 'Poissons',
  price: 15
)
Restaurant.create!(
  name: "Le Saint-Jacques",
  address: 'Saint-Raphael',
  description: "La délice des Saint-Jacques à Marseille",
  category: 'Poissons',
  price: 15
)
Flat.create!(
  name: "Sea Appartement",
  address: 'vieux-port, Marseille',
  description: "Magnifique appartement avec une superbe vue la mer",
  capicity: 4,
  price: 90,
  label: 'ATR'
)
Flat.create!(
  name: "Chez Lili",
  address: 'centre ville, Saint-Raphael',
  description: "Idéal pour votre voyage en famille",
  capicity: 6,
  price: 120,
  label: 'ATES'
)
Activity.create!(
  name: "Balade en bateau",
  address: 'Marseille',
  description: "Balade dans la mer pour vivre la lévé du soleil",
  category: 'Sortie guidé',
  price: 100
)
Activity.create!(
  name: "Découvre Saint-Raphael",
  address: 'Saint-Raphael',
  description: "Balade dans la village",
  category: 'Sortie guidée',
  price: 100
)
Trip.create!(
  name: "Mon voyage idyllique",
  address: 'Marseille',
  number_of_travellers: 4,
  user: User.last
  )
  Trip.last.restaurants << Restaurant.last

