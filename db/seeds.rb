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
  address: 'Marseille',
  description: "La délice des Sardines à Marseille. Poissons grillés, fruits de mer, tartares d'algues... de quoi ravir vos papilles avec des produits frais de la pêche du matin.",
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
  description: "Restaurant vénézuélien à Marseille. Venez decouvrir les plats typiques vénézuéliens préparés dans un environnement zéro plastique",
  category: 'Monde',
  price: 15,
  address: "16 Rue Bernard du Bois, 13001 Marseille"
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590999897/photo-1501199643997-e3ed9bfbd317_rqzrja.jpg')
  r2.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590999784/photo-1587603366933-aa6947174c65_uipnxp.jpg')
  r2.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  r3 = Restaurant.create!(
  name: "La Delicatesse",
  description: "La delicatesse de Marseille 100% bio",
  category: 'Cuisine française',
  price: 15,
  address: "7 boulevard de la Libération, 13001 Marseille"
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590674920/photo-1572205821737-01dfdaf0b012_xl3fnp.jpg')
  r3.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  r4 = Restaurant.create!(
  name: "La Table de L'olivier",
  description: "La meilleure cuisine traditionnelle française, fait avec des produits issus de circuits courts",
  category: 'Cuisine française',
  price: 15,
  address: "56 Rue Mazenod, 13002 Marseille"
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590675264/photo-1577219492769-b63a779fac28_idofsv.jpg')
  r4.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  r5 = Restaurant.create!(
  name: "Sushi resto",
  description: "Pour les amoureux du Sushi mais aussi de la nature",
  category: 'Japonais',
  price: 15,
  address: "27 B rue d'Italie, 13006 Marseille"
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1591000691/photo-1579584425555-c3ce17fd4351_vpb40k.jpg')
  r5.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  r6 = Restaurant.create!(
  name: "Mozz Art Pizza",
  description: "Comme en Italie mais 100% bio",
  category: 'Italien',
  price: 15,
  address: "58 rue d'Italie, 13006 Marseille"
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1591000775/photo-1520201163981-8cc95007dd2a_ifp8pt.jpg')
  r6.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  r7 = Restaurant.create!(
  name: "Le Saint-Jacques",
  address: '1, chemin de la Palmeraie, 84700 Saint-Raphaël',
  description: 'Les délices des Saint-Jacques à Saint-Raphaël, un restarurant engagé envers une pêche sélective de façon à ne pas capturer des espèces non désirées qui seront rejetées à la mer',
  category: 'Poissons',
  price: 15,
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590674964/photo-1547647611-395d6ed8a63d_zldmcl.jpg')
  r7.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590675294/photo-1559339352-11d035aa65de_t4dgsd.jpg')
  r7.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590669571/photo-1535106356142-e3169a8b17d2_jjafj0.jpg')
  r7.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  r8 = Restaurant.create!(
  name: "Le gourmet",
  address: '2 Place Amiral Ortoli, 83700, Saint-Raphaël',
  description: "La meilleure cuisine française à Saint Raphaël. Nous travaillons à l'anti-gaspillage alimentaire",
  category: 'Cuisine française',
  price: 15
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590674920/photo-1572205821737-01dfdaf0b012_xl3fnp.jpg')
  r8.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  r9 = Restaurant.create!(
  name: "Le Sud",
  address: '16 Boulevard Darby Route Des Golfs, 83700, Saint-Raphaël',
  description: "La meilleure cuisine française 100% bio à Saint Raphaël",
  category: 'Cuisine française',
  price: 15
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590674920/photo-1572205821737-01dfdaf0b012_xl3fnp.jpg')
  r9.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  f1 = Flat.create!(
  name: "Sea View",
  address: 'Marseille',
  description: "Nous vous rassurons l'utilisation de produits ménagers respecteux de l'environnement",
  capacity: 4,
  price: 80,
  label: 'ATR',
  availability: true
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590673971/photo-1503696967350-ad1874122058_gg6mhm.jpg')
  f1.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590674073/photo-1503174971373-b1f69850bded_yqulje.jpg')
  f1.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  f2 = Flat.create!(
  name: "Residhotel vert",
  address: '2 quai du port, 13002 Marseille',
  description: "Chez Residhotel, la piscine est traitée sans produits chimiques",
  capacity: 4,
  price: 90,
  label: 'ATR',
  availability: true
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1591001553/photo-1527142879-95b61a0b8226_ejupk0.jpg')
  f2.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590673098/photo-1499916078039-922301b0eb9b_m75ibp.jpg')
  f2.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  f3 = Flat.create!(
  name: "Golden Tulip Villa Massalia",
  address: '17 Place Louis Bonnefon, 13008 Marseille',
  description: "Car la beauté et la durabilité peuvent être ensemble, venez decouvrir toutes nos actions pour protéger l'environnement",
  capacity: 30,
  price: 45,
  label: 'ATR',
  availability: true
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590672932/photo-1467987506553-8f3916508521_y2bgky.jpg')
  f3.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  f4 = Flat.create!(
  name: "Hotel Le Grand Prado vert",
  address: '7 Square des Frères Ambrogiani, 13008 Marseille',
  description: "En plus des comoditée des chambres, l'hôtel vous propose dans chaque chambre des gels douches et des shampoings certifiés écocert",
  capacity: 12,
  price: 45,
  label: 'ATES',
  availability: true
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590674198/photo-1540518614846-7eded433c457_o62hpf.jpg')
  f4.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  f5 = Flat.create!(
  name: "Hôtel Kyriad Marseille Blancarde Timone",
  address: '4 Rue Emile Duclaux, 13004 Marseille',
  description: "Pour nous il est important de réduire les émissions de gaz à effets de serre. C’est la raison pour laquelle, les livraisons de blanchisserie pour l’Hôtel et le bar-restaurant sont regroupées le même jour à la même heure.",
  capacity: 12,
  price: 45,
  label: 'ATES',
  availability: true
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590674073/photo-1503174971373-b1f69850bded_yqulje.jpg')
  f5.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  f6 = Flat.create!(
  name: "Chez Lili",
  address: '12 avenue des golfs, Saint-Raphaël 83700',
  description: "Idéal pour votre voyage en famille, nous mettons à votre disposition un petit déjeuner écolo tous les matins de 7h00 à 11h00",
  capacity: 6,
  price: 120,
  label: 'ATES',
  availability: true
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590669863/photo-1503152889424-9c280f38cb1c_ambtfb.jpg')
  f6.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590672981/photo-1589296956373-b9fed26f6a3d_nbo0wk.jpg')
  f6.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590674450/photo-1509481799743-a6a536be8100_yvx8dc.jpg')
  f6.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  a1 = Activity.create!(
  name: "Balade en bateau",
  address: 'quai du port, 13002 Marseille',
  description: "Balade guidée en mer pour vivre le lever du soleil. Nous partirons en kayak pour un impact zéro carbone",
  category: 'Sortie guidée zéro carbone',
  price: 80
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590677300/photo-1463567517034-628c51048aa2_pifssj.jpg')
  a1.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  a2 = Activity.create!(
  name: "Cours de cuisine avec une mamie",
  address: '12 rue de Lyon, 13005 Marseille',
  description: "Apprenez la cuisine traditionnelle marseillaise pendant deux heures avec une mamie et ses produits naturels",
  category: 'Developpement local',
  price: 80
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1591004015/photo-1577048982771-1960014bde8b_gmpdrm.jpg')
  a2.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

  a3 = Activity.create!(
  name: "Découvre Saint-Raphaël",
  address: 'Saint-Raphaël',
  description: "Si vous voulez appuyer l'économie locale, je vous propose une balade dans le village et vous accompagne dans la découverte des commerçants locaux",
  category: 'Sortie guidée, dévéloppement local',
  price: 20
  )
file = URI.open('https://res.cloudinary.com/doprhpcd8/image/upload/v1590669571/photo-1535106356142-e3169a8b17d2_jjafj0.jpg')
  a3.photos.attach(io: file, filename: 'nes1.png', content_type: 'image/png')

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

