Trip.destroy_all
Flat.destroy_all
Restaurant.destroy_all
Activity.destroy_all
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
  description: "La délice des Sardines à Marseille. Poissons grillés, fruits de mer, tartares d'algues... de quoi ravir vos papilles avec des produits frais de la pêche du matin.",
  category: 'Poissons',
  price: 15
)
Restaurant.create!(
  name: "Le Saint-Jacques",
  address: 'Saint-Raphaël',
  description: "Un restaurant qui marie les saveurs méditéranéennes au service des produits de la mer.",
  category: 'Poissons',
  price: 15
)
Flat.create!(
  name: "Sea Appartement",
  address: 'Marseille',
  description: "Magnifique appartement avec une superbe vue la mer",
  capacity: 4,
  price: 90,
  label: 'ATR',
  availability: true
)
Flat.create!(
  name: "Chez Lili",
  address: 'Saint-Raphaël',
  description: "Idéal pour votre voyage en famille",
  capacity: 6,
  price: 120,
  label: 'ATES',
  availability: true
)
Activity.create!(
  name: "Balade en bateau",
  address: 'Marseille',
  description: "Balade dans la mer pour vivre la lévé du soleil",
  category: 'Sortie guidé',
  price: 80
)
Activity.create!(
  name: "Découvre Saint-Raphaël",
  address: 'Saint-Raphaël',
  description: "Balade dans la village",
  category: 'Sortie guidée',
  price: 20
)
Trip.create!(
  name: "Mon voyage idyllique",
  location: 'Marseille',
  number_of_travellers: 4,
  user: User.last
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

