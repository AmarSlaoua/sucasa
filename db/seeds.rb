###################################   CLEANING DATABASE   ##################################################

puts "Deleting db ..."

Review.delete_all
Message.delete_all
Modality.delete_all
Exchange.delete_all
Accommodation.delete_all
User.delete_all
Company.delete_all

puts "DB deleted !"

###################################   CREATING COMPANIES   ##################################################

puts "Creating 3 fake companies ... "
file1 = URI.open("https://www.creativosonline.org/wp-content/uploads/2022/07/Logotipo-carrefour.jpg")
file2 = URI.open("https://oxygen-ladefense.fr/wp-content/uploads/2020/06/logo-bioburger.jpg")
file3 = URI.open("https://img.freepik.com/icones-gratuites/mac-os_318-10374.jpg")

c1 = Company.new(
  name: "Carrefour",
  industry: "Retail",
)
c1.photo.attach(io: file1, filename: "logocarrefour.jpg", content_type: "image/jpg")
c1.save!
puts "..."

c2 = Company.new(
  name: "BioBurger",
  industry: "Fast-food",
)
c2.photo.attach(io: file2, filename: "logobioburger.jpg", content_type: "image/jpg")
c2.save!
puts "..."

c3 = Company.new(
  name: "Apple",
  industry: "Tech",
)
c3.photo.attach(io: file3, filename: "logoapple.jpg", content_type: "image/jpg")
c3.save!
puts "..."

puts "3 fake companies created !"

###################################   CREATING USERS   ##################################################

puts "Creating 15 fake users..."

pp1 = URI.open("https://t4.ftcdn.net/jpg/01/29/43/85/360_F_129438556_1ugKA7Fk1EiR7uar9ZGaQ3wYfaWSM25E.jpg")
pp2 = URI.open("https://images.iphonephotographyschool.com/24755/portrait-photography.jpg")
pp3 = URI.open("https://img.freepik.com/photos-gratuite/jeune-femme-reveuse-lunettes-soleil-avant_197531-16739.jpg")
pp4 = URI.open("https://bidunart.com/wp-content/uploads/2019/11/Portrait157a-819x1024.jpg")
pp5 = URI.open("https://phototrend.fr/wp-content/uploads/2015/02/portrait2-940x627.jpg")
pp6 = URI.open("https://www.worldphoto.org/sites/default/files/default-media/Piercy.jpg")
pp7 = URI.open("https://t4.ftcdn.net/jpg/01/29/43/85/360_F_129438556_1ugKA7Fk1EiR7uar9ZGaQ3wYfaWSM25E.jpg")
pp8 = URI.open("https://www.peerspace.com/resources/wp-content/uploads/best-vancouver-portrait-photographers.png")
pp9 = URI.open("https://i.pinimg.com/originals/39/e9/b3/39e9b39628e745a39f900dc14ee4d9a7.jpg")
pp10 = URI.open("https://t3.ftcdn.net/jpg/02/22/85/16/360_F_222851624_jfoMGbJxwRi5AWGdPgXKSABMnzCQo9RN.jpg")
pp11 = URI.open("https://www.myposter.de/magazin/wp-content/uploads/2016/06/Portrait-junger-Mann-frontal-shutterstock_62464225_kl.jpg")
pp12 = URI.open("https://apprendre-la-photo.fr/wp-content/uploads/2011/06/photo-portrait_vieil-homme_laurent-breillat-407x610.jpg")
pp13 = URI.open("https://www.sophiebourgeixphotographe.com/wp-content/uploads/2018/03/photos_portrait_Aix_en_provence_berenice05.jpg")
pp14 = URI.open("https://www.myposter.fr/magazin/wp-content/uploads/2016/06/Portrait-junge-Frau-Brille-shutterstock_118972231_kl.jpg")
pp15 = URI.open("https://cdn.mos.cms.futurecdn.net/3kZ3hc2YMB6LXiPohtyfKa.jpg")

somya = User.new(
  first_name: "Somya",
  last_name: "Abbar",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "somya@sucasa.com",
  password: "123456",
  company_id: c1.id,
  job: "CEO",
  seniority: rand(1..10),
)
somya.photo.attach(io: pp1, filename: "ppsomya.jpg", content_type: "image/jpg")
somya.save!
puts "..."

romain = User.new(
  first_name: "Romain",
  last_name: "Deflo",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "romain@sucasa.com",
  password: "123456",
  company_id: c1.id,
  job: "Vice-CEO",
  seniority: rand(1..10),
)
romain.photo.attach(io: pp2, filename: "ppromain.jpg", content_type: "image/jpg")
romain.save!
puts "..."

amar = User.new(
  first_name: "Amar",
  last_name: "Slaoua",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "amar@sucasa.com",
  password: "123456",
  company_id: c1.id,
  job: "Vice-CEO",
  seniority: rand(1..10),
)
amar.photo.attach(io: pp3, filename: "ppamar.jpg", content_type: "image/jpg")
amar.save!
puts "..."

fu1 = User.new(
  first_name: "Louis",
  last_name: "Poisson",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "louis@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Buyer",
  seniority: rand(1..10),
)
fu1.photo.attach(io: pp4, filename: "ppfu1.jpg", content_type: "image/jpg")
fu1.save!
puts "..."

fu2 = User.new(
  first_name: "Alice",
  last_name: "Perrin",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "alice@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Crew member",
  seniority: rand(1..10),
)
fu2.photo.attach(io: pp5, filename: "ppfu2.jpg", content_type: "image/jpg")
fu2.save!
puts "..."

fu3 = User.new(
  first_name: "Julie",
  last_name: "Techene",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "julie@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Musician",
  seniority: rand(1..10),
)
fu3.photo.attach(io: pp6, filename: "ppfu3.jpg", content_type: "image/jpg")
fu3.save!
puts "..."

fu4 = User.new(
  first_name: "Franck",
  last_name: "LeBoeuf",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "franck@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Footballer",
  seniority: rand(1..10),
)
fu4.photo.attach(io: pp7, filename: "ppfu4.jpg", content_type: "image/jpg")
fu4.save!
puts "..."

fu5 = User.new(
  first_name: "Karim",
  last_name: "Benzema",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "karim@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Athlete",
  seniority: rand(1..10),
)
fu5.photo.attach(io: pp8, filename: "ppfu5.jpg", content_type: "image/jpg")
fu5.save!
puts "..."

fu6 = User.new(
  first_name: "Serena",
  last_name: "Williams",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "serena@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Consultant",
  seniority: rand(1..10),
)
fu6.photo.attach(io: pp9, filename: "ppfu6.jpg", content_type: "image/jpg")
fu6.save!
puts "..."

fu7 = User.new(
  first_name: "LeBron",
  last_name: "James",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "lebron@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "GOAT",
  seniority: rand(1..10),
)
fu7.photo.attach(io: pp10, filename: "ppfu7.jpg", content_type: "image/jpg")
fu7.save!
puts "..."

fu8 = User.new(
  first_name: "Patrick",
  last_name: "Bruel",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "patrick@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Poker player",
  seniority: rand(1..10),
)
fu8.photo.attach(io: pp11, filename: "ppfu8.jpg", content_type: "image/jpg")
fu8.save!
puts "..."

fu9 = User.new(
  first_name: "Kaaris",
  last_name: "Kaaris",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "kaaris@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Rapper",
  seniority: rand(1..10),
)
fu9.photo.attach(io: pp12, filename: "ppfu9.jpg", content_type: "image/jpg")
fu9.save!
puts "..."

fu10 = User.new(
  first_name: "Brad",
  last_name: "Pitt",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "brad@mail.com",
  password: "123456",
  company_id: c2.id,
  job: "Actor",
  seniority: rand(1..10),
)
fu10.photo.attach(io: pp13, filename: "ppfu10.jpg", content_type: "image/jpg")
fu10.save!
puts "..."

fu11 = User.new(
  first_name: "Mickey",
  last_name: "Mouse",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "mickey@mail.com",
  password: "123456",
  company_id: c2.id,
  job: "Security",
  seniority: rand(1..10),
)
fu11.photo.attach(io: pp14, filename: "ppfu11.jpg", content_type: "image/jpg")
fu11.save!
puts "..."

fu12 = User.new(
  first_name: "Elon",
  last_name: "Musk",
  bio: "Hello everyone! My name is Claire, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "elon@mail.com",
  password: "123456",
  company_id: c2.id,
  job: "Business angel",
  seniority: rand(1..10),
)
fu12.photo.attach(io: pp15, filename: "ppfu12.jpg", content_type: "image/jpg")
fu12.save!
puts "..."

puts "15 users created !"

###################################   CREATING ACCOMMODATIONS   ##################################################

puts "Creating 12 fake accommodations for each 12 fake users ..."

add1 = "84 Cours de la Marne, 33000 Bordeaux"
add2 = "34 Rue Fernand Marin, 33000 Bordeaux"
add3 = "115 Rue des Pyrénées, 75020 Paris"
add4 = "3 Avenue Lacassagne, 69003 Lyon"
add5 = "14 Avenue du Maréchal Joffre, 93160 Noisy-Le-Grand"
add6 = "9 Rue du Commandant Jean Louis Tulasne, 62100 Calais"
add7 = "8 Rue des Écrivains, 67000 Strasbourg"
add8 = "13 Rue d'Aix, 13001 Marseille"
add9 = "41 Cr Gambetta, 34070 Montpellier"
add10 = "3 Pl. Georges Clemenceau, 64200 Biarritz"
add11 = "23 Rue Gosselet, 59000 Lille"
add12 = "5 Rue des Cordeliers, 44000 Nantes"


t1 = "Modern Apartment in the Heart of the City"
t2 = "Apartment with Spectacular Views"
t3 = "Cozy Apartment with Retro Vibes"
t4 = "Elegant and Spacious Apartment"
t5 = "Beachfront Apartment with Ocean Views"
t6 = "Countryside Apartment Surrounded by Nature"
t7 = "Chic Loft Apartment in a Vibrant Neighborhood"
t8 = "Stunning Apartment in a Heritage Building"
t9 = "Beautiful accommodation in the suburbs"
t10 = "Perfect flat if you want to visit the city center"
t11 = "Nice loft near the seaside"
t12 = "Little country house with a ranch"


picture1 = URI.open("https://a0.muscache.com/im/pictures/9b1faeae-d151-42ea-a498-18d9db4afe4b.jpg?im_w=1200")
picture2 = URI.open("https://a0.muscache.com/im/pictures/bb9ebad6-6048-41a8-8947-555d6527b94f.jpg?im_w=1200")
picture3 = URI.open("https://a0.muscache.com/im/pictures/miso/Hosting-534484668691956237/original/c592b1eb-8f33-432d-a536-9c29906dd3cb.jpeg?im_w=1440")
picture4 = URI.open("https://a0.muscache.com/im/pictures/prohost-api/Hosting-852103052054519896/original/5e197e8c-e611-4fb6-bb23-370908cbc1dc.jpeg?im_w=1200")
picture5 = URI.open("https://a0.muscache.com/im/pictures/0d1e5797-8f47-418f-acee-475f3b9c22c0.jpg?im_w=1200")
picture6 = URI.open("https://a0.muscache.com/im/pictures/miso/Hosting-671622319399090627/original/37e0ed75-118f-402e-95c7-2c62512acdd5.jpeg?im_w=1200")
picture7 = URI.open("https://a0.muscache.com/im/pictures/miso/Hosting-724287706736603735/original/68e4dc6a-14f5-49dd-8f30-3f53386ac2bd.jpeg?im_w=1440")
picture8 = URI.open("https://cdn.apartmenttherapy.info/image/upload/v1554209861/at/house%20tours%20stock%20archive/312b3933109935c5f33f6b8ec4a271669eb2d78a.jpg")
picture9 = URI.open("https://a0.muscache.com/im/pictures/miso/Hosting-50250873/original/785842db-7736-4bde-a9cb-c649e99f50a8.jpeg?im_w=1200")
picture10 = URI.open("https://a0.muscache.com/im/pictures/miso/Hosting-798490574765766838/original/89371196-d780-4a9c-a107-3d47e4b94451.jpeg?im_w=1200")
picture11 = URI.open("https://a0.muscache.com/im/pictures/769cd8c2-8c91-437d-8555-57e824189c8a.jpg?im_w=1200")
picture12 = URI.open("https://oportfolio.co.uk/wp-content/uploads/2022/09/airbnb-mortgage.jpg")

acco1 = Accommodation.new(
  user_id: fu1.id,
  title: t1,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: add1,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 1,
  swimming_pool: 1,
  balcony: 0,
  nb_of_tvs: rand(0..3)
)
acco1.photos.attach(io: picture1, filename: "pic1.jpg", content_type: "image/jpg")
acco1.save!
puts "..."

acco2 = Accommodation.new(
  user_id: fu2.id,
  title: t2,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: add2,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 0,
  swimming_pool: 0,
  balcony: 1,
  nb_of_tvs: rand(0..3)
)
acco2.photos.attach(io: picture2, filename: "pic2.jpg", content_type: "image/jpg")
acco2.save!
puts "..."

acco3 = Accommodation.new(
  user_id: fu3.id,
  title: t3,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: add3,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 1,
  swimming_pool: 0,
  balcony: 0,
  nb_of_tvs: rand(0..3)
)
acco3.photos.attach(io: picture3, filename: "pic3.jpg", content_type: "image/jpg")
acco3.save!
puts "..."

acco4 = Accommodation.new(
  user_id: fu4.id,
  title: t4,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: add4,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 1,
  swimming_pool: 1,
  balcony: 1,
  nb_of_tvs: rand(0..3)
)
acco4.photos.attach(io: picture4, filename: "pic4.jpg", content_type: "image/jpg")
acco4.save!
puts "..."

acco5 = Accommodation.new(
  user_id: fu5.id,
  title: t5,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: add5,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 0,
  swimming_pool: 1,
  balcony: 0,
  nb_of_tvs: rand(0..3)
)
acco5.photos.attach(io: picture5, filename: "pic5.jpg", content_type: "image/jpg")
acco5.save!
puts "..."

acco6 = Accommodation.new(
  user_id: fu6.id,
  title: t6,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: add6,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 0,
  swimming_pool: 0,
  balcony: 0,
  nb_of_tvs: rand(0..3)
)
acco6.photos.attach(io: picture6, filename: "pic6.jpg", content_type: "image/jpg")
acco6.save!
puts "..."

acco7 = Accommodation.new(
  user_id: fu7.id,
  title: t7,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: add7,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 1,
  swimming_pool: 0,
  balcony: 0,
  nb_of_tvs: rand(0..3)
)
acco7.photos.attach(io: picture7, filename: "pic7.jpg", content_type: "image/jpg")
acco7.save!
puts "..."

acco8 = Accommodation.new(
  user_id: fu8.id,
  title: t8,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: add8,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 1,
  swimming_pool: 1,
  balcony: 0,
  nb_of_tvs: rand(0..3)
)
acco8.photos.attach(io: picture8, filename: "pic8.jpg", content_type: "image/jpg")
acco8.save!
puts "..."

acco9 = Accommodation.new(
  user_id: fu9.id,
  title: t9,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: add9,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 0,
  swimming_pool: 1,
  balcony: 1,
  nb_of_tvs: rand(0..3)
)
acco9.photos.attach(io: picture9, filename: "pic9.jpg", content_type: "image/jpg")
acco9.save!
puts "..."

acco10 = Accommodation.new(
  user_id: fu10.id,
  title: t10,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: add10,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 1,
  swimming_pool: 1,
  balcony: 0,
  nb_of_tvs: rand(0..3)
)
acco10.photos.attach(io: picture10, filename: "pic10.jpg", content_type: "image/jpg")
acco10.save!
puts "..."

acco11 = Accommodation.new(
  user_id: fu11.id,
  title: t11,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: add11,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 1,
  swimming_pool: 1,
  balcony: 1,
  nb_of_tvs: rand(0..3)
)
acco11.photos.attach(io: picture11, filename: "pic11.jpg", content_type: "image/jpg")
acco11.save!
puts "..."

acco12 = Accommodation.new(
  user_id: fu12.id,
  title: t12,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: add12,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 0,
  swimming_pool: 0,
  balcony: 0,
  nb_of_tvs: rand(0..3)
)
acco12.photos.attach(io: picture12, filename: "pic12.jpg", content_type: "image/jpg")
acco12.save!
puts "..."

puts "12 fake accommodations created !"

puts "Creating 3 fake super accommodations for each 3 super users ..."

st1 = "Breathtaking flat with a view"
st2 = "Cocooning appartment near the river"
st3 = "Stunning modern house next to the forest"

sadd1 = "120 Avenue des Champs-Elysées, 75008 Paris"
sadd2 = "75 Rue de la Parlette, 63000 Clermont-Ferrand"
sadd3 = "18 Rue du Chaudronnier, 79000 Niort"

sp1 = URI.open("https://i.pinimg.com/originals/72/5e/d6/725ed67a503311cfa08ea07fc3835981.jpg")
sp2 = URI.open("https://media.architecturaldigest.com/photos/5d2f3540dea3bc0008636368/16:9/w_2580,c_limit/After-Photo-7.jpg")
sp3 = URI.open("https://cdn.trendir.com/wp-content/uploads/old/archives/2015/12/07/1-kitchen-design-lofts-3-urban-ideas-snaidero.jpg")
sp4 = URI.open("https://homedesignlover.com/wp-content/uploads/2016/04/4-loft-loft.jpg")
sp5 = URI.open("https://images.unsplash.com/photo-1493809842364-78817add7ffb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aGF1c3NtYW5pYW4lMjBhcHBhcnRtZW50fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60")
sp6 = URI.open("https://images.unsplash.com/photo-1496180727794-817822f65950?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aGF1c3NtYW5pYW4lMjBhcHBhcnRtZW50fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60")
sp7 = URI.open("https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGhhdXNzbWFuaWFuJTIwYXBwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60")
sp8 = URI.open("https://images.unsplash.com/photo-1556020685-ae41abfc9365?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGhhdXNzbWFuaWFuJTIwYXBwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60")
sp9 = URI.open("https://upload.wikimedia.org/wikipedia/commons/7/7d/Chambre_du_Dauphin%2C_Ch%C3%A2teau_de_Versailles_-_01.jpg")
sp10 = URI.open("https://up.univ-nantes.fr/medias/photo/csm-ref-versailles-france-54ddd70ccd_1681720826219-jpg")
sp11 = URI.open("https://www.chateaux-forts-de-france.fr/wp-content/uploads/2018/09/versailles-1.jpg")
sp12 = URI.open("https://www.transilien.com/sites/transilien/files/styles/manual_crop/public/2021-12/galerie-des-glaces.jpg?h=9a7773c7&itok=KEDAnHsE")

super_pictures1 = [sp1, sp2, sp3, sp4]
super_pictures2 = [sp5, sp6, sp7, sp8]
super_pictures3 = [sp9, sp10, sp11, sp12]



super_acco_1 = Accommodation.new(
  user_id: somya.id,
  title: st1,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: sadd1,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 0,
  swimming_pool: 0,
  balcony: 0,
  nb_of_tvs: rand(0..3)
)
super_pictures1.each do |picture|
  file = URI.open(picture)
  super_acco_1.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
super_acco_1.save!
puts "..."

super_acco_2 = Accommodation.new(
  user_id: romain.id,
  title: st2,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: sadd2,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 0,
  swimming_pool: 0,
  balcony: 0,
  nb_of_tvs: rand(0..3)
)
super_pictures2.each do |picture|
  file = URI.open(picture)
  super_acco_2.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
super_acco_2.save!
puts "..."

super_acco_3 = Accommodation.new(
  user_id: amar.id,
  title: st3,
  description: "Welcome to our charming home! Located in a vibrant neighborhood, our accommodation offers a cozy and comfortable space for your stay. We've carefully designed every corner to create a warm and inviting atmosphere. With convenient amenities and a welcoming ambiance, our home is the perfect base for you to explore and experience the local culture. We can't wait to welcome you and make your stay unforgettable!",
  address: sadd3,
  nb_of_guests: rand(1..10),
  nb_of_bedrooms: rand(1..8),
  nb_of_beds: rand(1..16),
  nb_of_bathrooms: rand(1..4),
  garden: 0,
  swimming_pool: 0,
  balcony: 0,
  nb_of_tvs: rand(0..3)
)
super_pictures3.each do |picture|
  file = URI.open(picture)
  super_acco_3.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
super_acco_3.save!
puts "..."

puts "3 super accommodations created !"

############################################### EXCHANGES #################################################################

puts "creating 3 exchanges, all super users exchange their homes with each other..."

e1 = Exchange.new(
  check_in: Date.parse("2023-01-10"),
  check_out: Date.parse("2023-01-20"),
  duration: 10
)
e1.save!
puts "..."

e2 = Exchange.new(
  check_in: Date.parse("2022-07-15"),
  check_out: Date.parse("2023-07-30"),
  duration: 15
)
e2.save!
puts "..."

e3 = Exchange.new(
  check_in: Date.parse("2023-08-12"),
  check_out: Date.parse("2023-08-30"),
  duration: 18
)
e3.save!
puts "..."

############################################### MODALITIES #################################################################

puts "creating 6 modalities, 2 for each exchange ..."

m1_e1 = Modality.new(
  accommodation_id: super_acco_1.id,
  exchange_id: e1.id,
  duration: 10,
  check_in: Date.parse("2023-01-10"),
  check_out: Date.parse("2023-01-20"),
  keys: "office",
  petsitting: 1,
  transportation: "car",
  others: "other modality parameter",
)
m1_e1.save!
puts "..."

m2_e1 = Modality.new(
  accommodation_id: super_acco_2.id,
  exchange_id: e1.id,
  duration: 10,
  check_in: Date.parse("2023-01-10"),
  check_out: Date.parse("2023-01-20"),
  keys: "handover",
  petsitting: 1,
  transportation: "bike",
  others: "other modality parameter",
)
m2_e1.save!
puts "..."

m1_e2 = Modality.new(
  accommodation_id: super_acco_1.id,
  exchange_id: e2.id,
  duration: 15,
  check_in: Date.parse("2022-07-15"),
  check_out: Date.parse("2023-07-30"),
  keys: "office",
  petsitting: 0,
  transportation: "car",
  others: "other modality parameter",
)
m1_e2.save!
puts "..."

m2_e2 = Modality.new(
  accommodation_id: super_acco_3.id,
  exchange_id: e2.id,
  duration: 15,
  check_in: Date.parse("2022-07-15"),
  check_out: Date.parse("2023-07-30"),
  keys: "handover",
  petsitting: 1,
  transportation: "bike",
  others: "other modality parameter",
)
m2_e2.save!
puts "..."

m1_e3 = Modality.new(
  accommodation_id: super_acco_2.id,
  exchange_id: e3.id,
  duration: 18,
  check_in: Date.parse("2023-08-12"),
  check_out: Date.parse("2023-08-30"),
  keys: "office",
  petsitting: 0,
  transportation: "car",
  others: "other modality parameter",
)
m1_e3.save!
puts "..."

m2_e3 = Modality.new(
  accommodation_id: super_acco_3.id,
  exchange_id: e3.id,
  duration: 18,
  check_in: Date.parse("2023-08-12"),
  check_out: Date.parse("2023-08-30"),
  keys: "handover",
  petsitting: 0,
  transportation: "bike",
  others: "other modality parameter",
)
m2_e3.save!
puts "..."

puts "6 modalities created !"

############################################### REVIEWS #################################################################

puts "creating 6 reviews, 2 for each exchange ..."

r1 = Review.new(
  user_id: somya.id,
  content: "Best trip ever. See you at the office !!",
  modality_id: m1_e1.id
)
r1.save!
puts "..."

r2 = Review.new(
  user_id: somya.id,
  content: "I wish we could exchange our homes permanently... But I know you would never agree ahah !",
  modality_id: m2_e1.id
)
r2.save!
puts "..."

r3 = Review.new(
  user_id: romain.id,
  content: "Best way to visit the region and by far ! It was our first home exchange... and certainly not the last",
  modality_id: m1_e2.id
)
r3.save!
puts "..."

r4 = Review.new(
  user_id: romain.id,
  content: "Nothing to say, everything was incredible, thanks again for all your advice",
  modality_id: m2_e2.id
)
r4.save!
puts "..."

r5 = Review.new(
  user_id: amar.id,
  content: "I absolutely loved the house and my stay overall. Somya was super nice and really made the city special for my wife and I",
  modality_id: m1_e3.id
)
r5.save!
puts "..."

r6 = Review.new(
  user_id: amar.id,
  content: "Thank you Romain !!! What a lovely home you have. Having a car to go around with easy parking was a blast I must say",
  modality_id: m2_e3.id
)
r6.save!
puts "6 reviews created !"

############################################### MESSAGES #################################################################

puts "creating 10 messages, all for the the same exchange ..."

me1_e1 = Message.new(
  user_id: somya.id,
  exchange_id: e1.id,
  content: "Hello Romain I looooove your house I'd love to make an exchange, wdyt?"
)
me1_e1.save!
puts "..."

me2_e1 = Message.new(
  user_id: romain.id,
  exchange_id: e1.id,
  content: "Hi Somya, sure sounds great !! How long would you like it to be ? 10 days sounds good to me"
)
me2_e1.save!
puts "..."

me3_e1 = Message.new(
  user_id: somya.id,
  exchange_id: e1.id,
  content: "Great news... But 10 days is a little bit short for me. Could 14 work ?"
)
me3_e1.save!
puts "..."

me4_e1 = Message.new(
  user_id: romain.id,
  exchange_id: e1.id,
  content: "Yes I can probably make that work. I'll set up my availability"
)
me4_e1.save!
puts "..."

me5_e1 = Message.new(
  user_id: somya.id,
  exchange_id: e1.id,
  content: "Okkkkkk seems that it will be for the beginning of September then ! PERFECT the weather is still warm and there aren't a lof of tourists around. For the keys I'm thinking about leaving them at the office since I live closeby. wdyt?"
)
me5_e1.save!
puts "..."

me6_e1 = Message.new(
  user_id: romain.id,
  exchange_id: e1.id,
  content: "Good to me. I have a spare set of keys, and Lucas is in our office right now. I'll them to him so he can pass them to you when it goes back"
)
me6_e1.save!
puts "..."

me7_e1 = Message.new(
  user_id: somya.id,
  exchange_id: e1.id,
  content: "Ahah I wouldn't entrust my keys to lucas ;) I'll leave my car in the garage, feel free to use it I already updated my insurance during for that purpose for my last exchange. Can we take yours too ?"
)
me7_e1.save!
puts "..."

me8_e1 = Message.new(
  user_id: romain.id,
  exchange_id: e1.id,
  content: "Oups unfortunatly Leo is going to take if to travel with his friends this summer. We have bikes, and honestly it's perfect to discover the city. Does this work for you ?"
)
me8_e1.save!
puts "..."

me9_e1 = Message.new(
  user_id: somya.id,
  exchange_id: e1.id,
  content: "Damn too bad but yeah sure why not"
)
me9_e1.save!
puts "..."

me10_e1 = Message.new(
  user_id: romain.id,
  exchange_id: e1.id,
  content: "Well... I'll ask my manager for the holidays then, shouldn't be a problem. Let's keep in touch!"
)
me10_e1.save!

puts "10 messages created !"
