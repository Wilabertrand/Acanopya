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
r1 = Restaurant.create!(
  name: "Maman sardine",
  description: "Le délice des Sardines à Marseille",
  category: 'Poissons',
  price: 15,
  address: "7 quai de Rive Neuve, 13001 Marseille"
)
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590674613/photo-1583144387451-8e17f0411183_wxo3kc.jpg')
  r1.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590674675/photo-1556814901-18c866c057da_q9ittn.jpg')
  r1.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590674785/photo-1550966871-3ed3cdb5ed0c_nlj8vg.jpg')
  r1.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')
r2 = Restaurant.create!(
  name: "Parchita",
  description: "Restaurant vénézuélien à Marseille",
  category: 'Répas typique',
  price: 15,
  address: "16 Rue Bernard du Bois, 13001 Marseille"
)
r3 = Restaurant.create!(
  name: "La Delicatesse",
  description: "Venez découvrir la delicatesse de Marseille",
  category: 'Cuisine française',
  price: 15,
  address: "7 boulevard de la Libération, 13001 Marseille"
)
r4 = Restaurant.create!(
  name: "La Table de L'olivier",
  description: "La meilleure cuisine traditionnelle française",
  category: 'Cuisine française',
  price: 15,
  address: "56 Rue Mazenod, 13002 Marseille"
)
r5 = Restaurant.create!(
  name: "Sushi resto",
  description: "Pour les amoureaux du Sushi",
  category: 'Japonais',
  price: 15,
  address: "27 B rue d'Italie, 13006 Marseille"
)
r6 = Restaurant.create!(
  name: "Mozz Art Pizza",
  description: "Comme en Italie",
  category: 'Italien',
  price: 15,
  address: "58 rue d'Italie, 13006 Marseille"
)
r7 = Restaurant.create!(
  name: "Le Saint-Jacques",
  address: '1, chemin de la Palmeraie, 84700 Saint-Raphaël',
  description: "Les délices des Saint-Jacques à Saint-Raphaël",
  category: 'Poissons',
  price: 15,
)
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590674964/photo-1547647611-395d6ed8a63d_zldmcl.jpg')
  r7.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')
r8 = Restaurant.create!(
  name: "Le gourmet",
  address: '2 Place Amiral Ortoli, 83700, Saint-Raphaël',
  description: "La meilleure cuisine française à Saint Raphaël",
  category: 'Cuisine française',
  price: 15
)
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590674920/photo-1572205821737-01dfdaf0b012_xl3fnp.jpg')
  r8.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')
r9 = Restaurant.create!(
  name: "Le Sud",
  address: '16 Boulevard Darby Route Des Golfs, 83700, Saint-Raphaël',
  description: "La meilleure cuisine française à Saint Raphaël",
  category: 'Cuisine française',
  price: 15
)
f1 = Flat.create!(
  name: "Sea View",
  address: 'Marseille',
  description: "Magnifique logement avec une superbe vue mer",
  capacity: 4,
  price: 80,
  label: 'ATR',
  availability: true
)
f2 = Flat.create!(
  name: "Residhotel",
  address: '2 quai du port, 13002 Marseille',
  description: "Nous sommes engagés avec l'environement",
  capacity: 4,
  price: 90,
  label: 'ATR',
  availability: true
)
f3 = Flat.create!(
  name: "Golden Tulip Villa Massalia",
  address: '17 Place Louis Bonnefon, 13008 Marseille',
  description: "Superbe logement à Marseille",
  capacity: 30,
  price: 45,
  label: 'ATR',
  availability: true
)
f4 = Flat.create!(
  name: "Residhotel Le Grand Prado",
  address: '7 Square des Frères Ambrogiani, 13008 Marseille',
  description: "Superbe et respectueux logement à Marseille",
  capacity: 12,
  price: 45,
  label: 'ATES',
  availability: true
)
f5 = Flat.create!(
  name: "Hôtel Kyriad Marseille Blancarde Timone",
  address: '4 Rue Emile Duclaux, 13004 Marseille',
  description: "Marseille est à vous",
  capacity: 12,
  price: 45,
  label: 'ATES',
  availability: true
)
f6 = Flat.create!(
  name: "Chez Lili",
  address: '12 avenue des golfs, Saint-Raphaël 83700',
  description: "Idéal pour votre voyage en famille",
  capacity: 6,
  price: 120,
  label: 'ATES',
  availability: true
)
a1 = Activity.create!(
  name: "Balade en bateau",
  address: 'quai du port, 13002 Marseille',
  description: "Balade en mer pour vivre le lever du soleil",
  category: 'Sortie guidée',
  price: 80
)
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590677300/photo-1463567517034-628c51048aa2_pifssj.jpg')
  a1.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')
Activity.create!(
  name: "Cours de danse",
  address: '12 rue de Lyon, 13005 Marseille',
  description: "Apprenez à danser la salsa",
  category: 'Sortie guidée',
  price: 80
)
a2 = Activity.create!(
  name: "Découvre Saint-Raphaël",
  address: 'Saint-Raphaël',
  description: "Balade dans le village",
  category: 'Sortie guidée',
  price: 20
)
t1 = Trip.create!(
  name: "Mon voyage idyllique",
  location: 'Marseille',
  number_of_travellers: 4,
  user: User.last
  )
t2 = Trip.create!(
  name: "Mon voyage à Saint-R",
  location: 'Saint-Raphaël',
  number_of_travellers: 5,
  user: User.last
)
t3 = Trip.create!(
  name: "Mon été en Marseille",
  location: 'Marseille',
  number_of_travellers: 4,
  user: User.last
)
Trip.last.restaurants << Restaurant.last

