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
  password: "123456",
  first_name: "astrid",
  last_name: "dc",
  admin: false
)
User.create!(
  email: "harold@mail.com",
  password: "123456",
  first_name: "harold",
  last_name: "ngano",
  admin: false
)
User.create!(
  email: "emmanuelle@mail.com",
  password: "123456",
  first_name: "emmanuelle",
  last_name: "cavarle",
  admin: false
)
User.create!(
  email: "wila@mail.com",
  password: "123456",
  first_name: "astrid",
  last_name: "dc",
  admin: false
)
User.create!(
  email: "admin@mail.com",
  password: "123456",
  first_name: "admin",
  last_name: "admin",
  admin: true
)
Restaurant.create!(
  name: "Maman sardine",
  address: 'Marseille',
  description: "La délice des Sardines à Marseille",
  category: 'Poissons',
  price: 15,
  latitude: 43.2961743,
  longitude: 5.3699525
)
Restaurant.create!(
  name: "Le Saint-Jacques",
  address: 'Saint-Raphaël',
  description: "Les délices des Saint-Jacques à Marseille",
  category: 'Poissons',
  price: 15,
  latitude: 43.4255303,
  longitude: 6.7694244
)
Flat.create!(
  name: "Sea Appartement",
  address: 'Marseille',
  description: "Magnifique appartement avec une superbe vue la mer",
  capacity: 4,
  price: 90,
  label: 'ATR',
  latitude: 43.2961743,
  longitude: 5.3699525,
  availability: true
)
Flat.create!(
  name: "Chez Lili",
  address: 'Saint-Raphaël',
  description: "Idéal pour votre voyage en famille",
  capacity: 6,
  price: 120,
  label: 'ATES',
  latitude: 43.4255303,
  longitude: 6.7694244,
  availability: true
)
Activity.create!(
  name: "Balade en bateau",
  address: 'Marseille',
  description: "Balade dans la mer pour vivre la lévé du soleil",
  category: 'Sortie guidé',
  price: 80,
  latitude: 43.2961743,
  longitude: 5.3699525
)
Activity.create!(
  name: "Découvre Saint-Raphaël",
  address: 'Saint-Raphaël',
  description: "Balade dans la village",
  category: 'Sortie guidée',
  price: 20,
  latitude: 43.4255303,
  longitude: 6.7694244
)
Trip.create!(
  name: "Mon voyage idyllique",
  location: 'Marseille',
  number_of_travellers: 4,
  user: User.last,
  )
  Trip.create!(
  name: "Mon voyage à Saint-R",
  location: 'Saint-Raphaël',
  number_of_travellers: 5,
  user: User.last
  )
  Trip.create!(
  name: "Mon été en Marseille",
  location: 'Marseille',
  number_of_travellers: 4,
  user: User.last
  )
  Trip.last.restaurants << Restaurant.last

