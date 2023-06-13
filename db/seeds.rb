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
  industry: "Retail"
)
c1.photo.attach(io: file1, filename: "logocarrefour.jpg", content_type: "image/jpg")
c1.save!
puts "..."

c2 = Company.new(
  name: "BioBurger",
  industry: "Fast-food"
)
c2.photo.attach(io: file2, filename: "logobioburger.jpg", content_type: "image/jpg")
c2.save!
puts "..."

c3 = Company.new(
  name: "Apple",
  industry: "Tech"
)
c3.photo.attach(io: file3, filename: "logoapple.jpg", content_type: "image/jpg")
c3.save!
puts "..."

puts "3 fake companies created !"

###################################   CREATING USERS   ##################################################

puts "Creating 15 fake users..."

pp1 = URI.open("https://avatars.githubusercontent.com/u/130504907?v=4")
pp2 = URI.open("https://media.licdn.com/dms/image/C5603AQHt6A6O0trmNg/profile-displayphoto-shrink_800_800/0/1517839980887?e=2147483647&v=beta&t=w088gT-EsnExEo6RtRHpylKlUYDY215BOB-81WRYCrA")
pp3 = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1683008769/aoe1v4frlvgve2uei7f4.jpg")
pp4 = URI.open("https://media.gettyimages.com/id/1139722168/fr/photo/milieu-adulte-dhomme-souriant-sur-le-fond-gris.jpg?s=612x612&w=gi&k=20&c=XRJrRbYB9kWitMJtBeZIPpxLsdq3-1TqGlSGjkwOgSE=")
pp5 = URI.open("https://img.freepik.com/photos-premium/femme-sourire-son-visage_266745-287.jpg?w=2000")
pp6 = URI.open("https://img.freepik.com/photos-premium/femme-sourire-son-visage-sourit_910718-48.jpg?w=2000")
pp7 = URI.open("https://media.istockphoto.com/id/966638378/fr/photo/portrait-dun-homme-latino-souriant.jpg?s=612x612&w=0&k=20&c=llIfoWoEuXfQ_is3HTaU9NgR6R7xLw-vDltJxTt6WIA=")
pp8 = URI.open("https://media.istockphoto.com/id/1309489745/fr/photo/verticale-de-jeune-cadre-indien-heureux-dhomme-daffaires-regardant-lappareil-photo.jpg?s=612x612&w=0&k=20&c=zjajgq8VVEK_XFZt2fG0xHB3mTbUoXTUqpxr217CUG0=")
pp9 = URI.open("https://img.freepik.com/photos-premium/jeune-femme-sourire-son-visage_853677-496.jpg?w=2000")
pp10 = URI.open("https://media.istockphoto.com/id/1182146844/fr/photo/jeune-homme-de-sourire-avec-des-tatouages-restant-sur-un-fond-gris.jpg?s=612x612&w=0&k=20&c=IShl3prqjWVQZRkQY_XGlqCY8v7CaelMOaPHShTdk3c=")
pp11 = URI.open("https://media.istockphoto.com/id/1275841749/fr/photo/jeune-homme-de-sourire-ayant-la-conf%C3%A9rence-en-ligne-de-la-maison.jpg?s=612x612&w=0&k=20&c=BsD8coODAb3vtCfFyXiBrJHiuG7sGwXMwNfdqD46oiY=")
pp12 = URI.open("https://www.portraitprofessionnel.fr/wp-content/uploads/2022/02/Photographe_profesionnel_portrait_studio_corporate.jpg")
pp13 = URI.open("https://upload.wikimedia.org/wikipedia/commons/b/bc/Dewaere-portrait.jpg")
pp14 = URI.open("https://www.galeriephotographe.com/wp-content/uploads/2020/04/shootings-photo-de-profil-reseaux-sociaux-et-professionnel-a-colmar_018.jpg")
pp15 = URI.open("https://isabellerobak.com/wp-content/uploads/2023/01/portrait-professionnel-isabelle-robak.jpg")

somya = User.new(
  first_name: "Somya",
  last_name: "Abbar",
  bio: "Hello everyone! My name is Somya, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
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
  bio: "Hello everyone! My name is Romain, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
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
  bio: "Hello everyone! My name is Amar, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
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
  bio: "Hello everyone! My name is Louis, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
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
  bio: "Hello everyone! My name is Alice, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
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
  bio: "Hello everyone! My name is Julie, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "julie@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Product owner",
  seniority: rand(1..10),
)
fu3.photo.attach(io: pp6, filename: "ppfu3.jpg", content_type: "image/jpg")
fu3.save!
puts "..."

fu4 = User.new(
  first_name: "Franck",
  last_name: "Dubois",
  bio: "Hello everyone! My name is Franck, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "franck@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Sales manager",
  seniority: rand(1..10),
)
fu4.photo.attach(io: pp7, filename: "ppfu4.jpg", content_type: "image/jpg")
fu4.save!
puts "..."

fu5 = User.new(
  first_name: "Karim",
  last_name: "Badraoui",
  bio: "Hello everyone! My name is Karim, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "karim@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Head of product",
  seniority: rand(1..10),
)
fu5.photo.attach(io: pp8, filename: "ppfu5.jpg", content_type: "image/jpg")
fu5.save!
puts "..."

fu6 = User.new(
  first_name: "Serena",
  last_name: "Stones",
  bio: "Hello everyone! My name is Serena, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "serena@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Head of sales",
  seniority: rand(1..10),
)
fu6.photo.attach(io: pp9, filename: "ppfu6.jpg", content_type: "image/jpg")
fu6.save!
puts "..."

fu7 = User.new(
  first_name: "Chris",
  last_name: "Smith",
  bio: "Hello everyone! My name is Chris, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "chris@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Artistic director",
  seniority: rand(1..10),
)
fu7.photo.attach(io: pp10, filename: "ppfu7.jpg", content_type: "image/jpg")
fu7.save!
puts "..."

fu8 = User.new(
  first_name: "Guillaume",
  last_name: "Dermel",
  bio: "Hello everyone! My name is Guillaume, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "guillaume@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Process manager",
  seniority: rand(1..10),
)
fu8.photo.attach(io: pp11, filename: "ppfu8.jpg", content_type: "image/jpg")
fu8.save!
puts "..."

fu9 = User.new(
  first_name: "Lamia",
  last_name: "Slaoua",
  bio: "Hello everyone! My name is Lamia, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "lamia@mail.com",
  password: "123456",
  company_id: c1.id,
  job: "Graphist",
  seniority: rand(1..10),
)
fu9.photo.attach(io: pp12, filename: "ppfu9.jpg", content_type: "image/jpg")
fu9.save!
puts "..."

fu10 = User.new(
  first_name: "Sergio",
  last_name: "Lesieur",
  bio: "Hello everyone! My name is Sergio, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "sergio@mail.com",
  password: "123456",
  company_id: c2.id,
  job: "Brand manager",
  seniority: rand(1..10),
)
fu10.photo.attach(io: pp13, filename: "ppfu10.jpg", content_type: "image/jpg")
fu10.save!
puts "..."

fu11 = User.new(
  first_name: "Solène",
  last_name: "Garnier",
  bio: "Hello everyone! My name is Solène, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "solene@mail.com",
  password: "123456",
  company_id: c2.id,
  job: "QA engineer",
  seniority: rand(1..10),
)
fu11.photo.attach(io: pp14, filename: "ppfu11.jpg", content_type: "image/jpg")
fu11.save!
puts "..."

fu12 = User.new(
  first_name: "Maxime",
  last_name: "Musk",
  bio: "Hello everyone! My name is Maxime, and I'm a passionate traveler. I love exploring new places and living like a local. I've been a member of this home exchange platform for several years now and have had some incredible experiences.
        My home is located in a charming neighborhood, surrounded by greenery and close to all amenities. It offers a comfortable and cozy space to welcome visitors. I've carefully decorated each room, and I'm confident you'll feel right at home.
        As a host, I'm attentive to the needs of my guests and strive to provide a memorable stay. I'm happy to share local tips and recommendations to make your visit unforgettable. Let's exchange homes and embark on a wonderful journey together!",
  email: "maxime@mail.com",
  password: "123456",
  company_id: c2.id,
  job: "Sales",
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


picture1 = URI.open("https://hips.hearstapps.com/hmg-prod/images/apartment-living-room-design-ideas-hbx040122nextwave-013-1656001210.jpg")
picture2 = URI.open("https://apartmentsnwsanantonio.com/wp-content/uploads/2018/12/Apartment-Rentals-San-Antonio-Bedroom.jpg")
picture3 = URI.open("https://hips.hearstapps.com/hmg-prod/images/martha-mulholland-standard-architecture-malibu-house-094-edit-1647617137.jpg")
picture4 = URI.open("https://i.pinimg.com/originals/15/4f/e4/154fe4a84ed87ff5b5cff0b55f6f136a.jpg")

pictures1 = [picture1, picture2, picture3, picture4]


picture5 = URI.open("https://cdn.mos.cms.futurecdn.net/vcKypmJpoxLHNrtjDyJnVa.jpg")
picture6 = URI.open("https://houstonapartmentsoneldridge.com/wp-content/uploads/2018/12/Apartments-for-rent-houston-tx-bedroom-1024x638.jpg")
picture7 = URI.open("https://www.bhg.com/thmb/-fMaB0U41bSke7O7bhH1cMl3g2s=/1244x0/filters:no_upscale():strip_icc()/black-white-modern-bathroom-plants-9a32b43a-8b9d4a315d88430882bfeef9c5d25d68.jpg")
picture8 = URI.open("https://www.howdens.com/-/media/howdens/assets/clh_asset_products/clh_asset_levela_108418/clh_asset_levelb_25522207/clh_asset_levelc_25519481/clh_asset_leveld_25522002/ass_25411377/ass_25411377_1_1.jpg")

pictures2 = [picture5, picture6, picture7, picture8]

picture9 = URI.open("https://www.bhg.com/thmb/dgy0b4w_W0oUJUxc7M4w3H4AyDo=/1866x0/filters:no_upscale():strip_icc()/living-room-gallery-shelves-l-shaped-couch-ELeyNpyyqpZ8hosOG3EG1X-b5a39646574544e8a75f2961332cd89a.jpg")
picture10 = URI.open("https://www.mydomaine.com/thmb/Cu5oA50vLVBUli6VUrsV8DjKIPI=/1920x0/filters:no_upscale():strip_icc()/spacejoy-nEtpvJjnPVo-unsplash1-8dc2f48f6c334ceca4f264dc608c5707.jpg")
picture11 = URI.open("https://www.thespruce.com/thmb/J53yaSLGsDzkOOTYiXuP52oMJ8I=/2048x0/filters:no_upscale():max_bytes(150000):strip_icc()/modern-bathroom-design-ideas-4129371-hero-723611e159bb4a518fc4253b9175eba8.jpg")
picture12 = URI.open("https://theeffortlesschic.com/wp-content/uploads/2021/03/Kitchen-Reveal-8.jpg")

pictures3 = [picture9, picture10, picture11, picture12]

picture13 = URI.open("https://i.ytimg.com/vi/RfYc0BUqkMs/maxresdefault.jpg")
picture14 = URI.open("https://apartmentsforrentsanantonio.com/wp-content/uploads/2018/03/ea34b50820fd023ecd0b470de7444e90fe76e7d718b5114897f5c0_640.jpg")
picture15 = URI.open("https://www.mydomaine.com/thmb/5pUHeJaBlbzo5QGN2UU-wPivc1s=/2986x0/filters:no_upscale():strip_icc()/9.Designerphotographerhouseofchais-93b0953f92dc4d21867cd0300585d5d0.jpg")
picture16 = URI.open("https://regencyoaksseniorliving.com/wp-content/uploads/31508090-shutterstock_1075737842-1.jpg")

pictures4 = [picture13, picture14, picture15, picture16]

picture17 = URI.open("https://decoholic.org/wp-content/uploads/2022/05/small-Scandinavian-apartment.jpg")
picture18 = URI.open("https://www.thespruce.com/thmb/oJGeEk9FPfjAbeWfDkjdb9Xk9TY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/perfect-studio-apartment-layouts-to-inspire-4124066-hero-86a20ac386734170914645029e7bb568.jpg")
picture19 = URI.open("https://www.thespruce.com/thmb/NaaNGlBVj7TmFMtVaMWQTdfiPuw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/master-bathroom-design-ideas-4129362-hero-d896a889451341dfaa59c5b2beacf02d.jpg")
picture20 = URI.open("https://premierhomesvic.com.au/wp/wp-content/uploads/2018/07/Delandra-Granny-Flat-Kitchen.jpg")

pictures5 = [picture17, picture18, picture19, picture20]

picture21 = URI.open("https://media.designcafe.com/wp-content/uploads/2021/11/08175133/cozy-small-apartment-ideas-for-your-home.jpg")
picture22 = URI.open("https://www.residence-brehova.com/images/two-bedroom/detail/large/bedroom2_2.jpg")
picture23 = URI.open("https://media.houseandgarden.co.uk/photos/640f159a3bcab740f371290e/1:1/w_2100,h_2100,c_limit/Tom-Cox-House-HG-Website-022-_DSF7461.jpg")
picture24 = URI.open("https://www.howdens.com/-/media/howdens/assets/clh_asset_corporate/clh_asset_levela_109324/clh_asset_levelb_25298484/clh_asset_levelc_25363632/clh_asset_leveld_25409906/ass_25452510/ass_25452510_1_1.jpg")

pictures6 = [picture21, picture22, picture23, picture24]

picture25 = URI.open("https://cdn.mos.cms.futurecdn.net/qUybam4p8t3Mf4Mvm3WcTA.jpg")
picture26 = URI.open("https://cdn.decoist.com/wp-content/uploads/2020/04/Separate-bedroom-in-the-one-bedroom-apartment-gives-you-ample-privacy-84410.jpg")
picture27 = URI.open("https://img.staticmb.com/mbcontent/images/uploads/2023/2/bathroom-interior-design.jpg")
picture28 = URI.open("https://blog.kitchenmagic.com/hs-fs/hubfs/RotM%20Feb%202020-6.jpg?width=800&name=RotM%20Feb%202020-6.jpg")

pictures7 = [picture25, picture26, picture27, picture28]

picture29 = URI.open("https://hips.hearstapps.com/hmg-prod/images/modern-living-room-black-white-1656377050.jpg")
picture30 = URI.open("https://uploads-ssl.webflow.com/5db0fce271caa26ad1ca0613/5e18cc88d27bcf43c704809b_1-bedroom-apartment.jpg")
picture31 = URI.open("https://hips.hearstapps.com/hmg-prod/images/allisonknizekdesign-erikabiermanphoto-5-1674499280.jpg")
picture32 = URI.open("https://cdn.apartmenttherapy.info/image/upload/v1556038329/at/house%20tours/archive/Farah%20Toronto/66075f0f7f5be8a1dee33b281cc3fc03c901788a.jpg")

pictures8 = [picture29, picture30, picture31, picture32]

picture33 = URI.open("https://www.home-designing.com/wp-content/uploads/2019/01/Small-apartment-design.jpg")
picture34 = URI.open("https://pyxis.nymag.com/v1/imgs/3b7/66f/9f550fcdabe47c4fd4f7943e4988993522-small-apartment-lede.jpg")
picture35 = URI.open("https://www.bigbathroomshop.co.uk/info/blog/wp-content/uploads/2018/11/Untitled-design-2021-03-03T120021.327.jpg")
picture36 = URI.open("https://i0.wp.com/realmumreview.com/wp-content/uploads/2021/10/kitchen-g93fa91515_1280.jpg")

pictures9 = [picture33, picture34, picture35, picture36]

picture37 = URI.open("https://nextluxury.com/wp-content/uploads/apartment-small-living-room-ideas-1.jpg")
picture38 = URI.open("https://media.designcafe.com/wp-content/uploads/2020/04/07174357/bedroom-colour-combination-with-burnt-orange-and-purple-1-768x512.jpg")
picture39 = URI.open("https://www.granddesignsmagazine.com/wp-content/uploads/2022/08/small-bathroom-wall-to-wall-bath.jpg")
picture40 = URI.open("https://innkeeper.pws.co.uk/secondnature/media/Advice%20&%20Ideas/designing%20a%20small%20kitchen/18%20Porter%20Gloss%20White%20Alt%20Angle1%20V2%20(FLAT)%20(1).jpg")

pictures10 = [picture37, picture38, picture39, picture40]

picture41 = URI.open("https://cdn.apartmenttherapy.info/image/upload/v1556039518/at/house%20tours/archive/Tour%20a%20Colorful%20Home%20in%20Montreal/9ddf96cc0b523b9b9b00e60dfb9ded877fb6b88b.jpg")
picture42 = URI.open("https://www.residence-brehova.com/images/one-bedroom/detail/large/bedroom_1.jpg")
picture43 = URI.open("https://www.thespruce.com/thmb/tp8Bmu3oO2BNQWbp7iFR27v_PRw=/1100x0/filters:no_upscale():max_bytes(150000):strip_icc()/cottageandseabohobathroomwide-2ef1bea60361472599b2441f1a96f1d6.jpg")
picture44 = URI.open("https://www.oppein-africa.com/wp-content/uploads/2019/11/Modern-Flat-Laminate-Beige-U-Shape-Kitchen-PLCC191312.jpg")

pictures11 = [picture41, picture42, picture43, picture44]

picture45 = URI.open("https://www.redfin.com/blog/wp-content/uploads/2022/04/Neutral-decor-apartment-.jpg")
picture46 = URI.open("https://hips.hearstapps.com/hmg-prod/images/boho-bedroom-floral-wallpaper-1610551540.jpg")
picture47 = URI.open("https://www.thespruce.com/thmb/XV_lLPySFdFY4d-VUixr8244P0I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/minimalist-bathroom-ideas-5121176-hero-cfadc3ce3546468c95c2fc1118346dd8.jpg")
picture48 = URI.open("https://files.theinteriorsaddict.com/uploads/2017/07/Flat-pack-kitchen.jpg")

pictures12 = [picture45, picture46, picture47, picture48]


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
pictures1.each do |picture|
  file = URI.open(picture)
  acco1.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
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
pictures2.each do |picture|
  file = URI.open(picture)
  acco2.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
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
pictures3.each do |picture|
  file = URI.open(picture)
  acco3.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
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
pictures4.each do |picture|
  file = URI.open(picture)
  acco4.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
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
pictures5.each do |picture|
  file = URI.open(picture)
  acco5.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
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
pictures6.each do |picture|
  file = URI.open(picture)
  acco6.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
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
pictures7.each do |picture|
  file = URI.open(picture)
  acco7.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
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
pictures8.each do |picture|
  file = URI.open(picture)
  acco8.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
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
pictures9.each do |picture|
  file = URI.open(picture)
  acco9.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
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
pictures10.each do |picture|
  file = URI.open(picture)
  acco10.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
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
pictures11.each do |picture|
  file = URI.open(picture)
  acco11.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
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
pictures12.each do |picture|
  file = URI.open(picture)
  acco12.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
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

sp1 = URI.open("https://media-cldnry.s-nbcnews.com/image/upload/newscms/2019_01/3165836/paris-living-room.jpg")
sp2 = URI.open("https://hips.hearstapps.com/hmg-prod/images/minimalist-bedrooms-romanekdesignstudiords-work-malibu-07-1591301745.jpg")
sp3 = URI.open("https://fontanarchitecture.com/wp-content/uploads/2017/11/Adding-a-batrhoom.jpg")
sp4 = URI.open("https://s42814.pcdn.co/wp-content/uploads/2020/04/0120_Westerly_Reveal_6C_Kitchen_Alt_Angles_Lights_on_15-1-scaled.jpg.optimal.jpg")

sp5 = URI.open("https://media.architecturaldigest.com/photos/57a0f16da065cffc07e86697/4:3/w_2663,h_1997,c_limit/rental-apartment-decorating-ideas-01.jpg")
sp6 = URI.open("https://cdn11.bigcommerce.com/s-s8pq4kiarm/images/stencil/1280x1280/products/1858/6747/adorna_ideaitaliabedroom_shot1_hero2-2_1_3__94884.1660043177.jpg")
sp7 = URI.open("https://www.guestapartment.com/wp-content/uploads/2016/07/19-Paris-Ile-Saint-Louis-Seine-River-Properties-Luxury-Bathroom-Acacia.jpg")
sp8 = URI.open("https://www.bhg.com/thmb/HIHRS69haDsoaRJTMYeYuXywv3k=/4000x0/filters:no_upscale():strip_icc()/Pink-kitchen-BPHo9SurqV5ADETPuQldyl-46ef8a6c11654ae08600af510025cdbb.jpg")

sp9 = URI.open("https://cdn.homedit.com/wp-content/uploads/2016/07/Minsk-apartment-by-I-project-dining-space-adjacent-to-lounge.jpg")
sp10 = URI.open("https://www.collinsdictionary.com/images/full/bed_large_724866226_1000.jpg")
sp11 = URI.open("https://stylesatlife.com/wp-content/uploads/2020/01/small-apartment-bathroom-ideas.jpg")
sp12 = URI.open("https://www.bhg.com/thmb/MaQDVndcD-FF3qtf9e50rmfVml4=/4000x0/filters:no_upscale():strip_icc()/bhg-modern-kitchen-8RbSHoA8aKT9tEG-DcYr56-039892da05774ea78f8682b3f693bb5d.jpg")

super_pictures1 = [sp1, sp2, sp3, sp4]
super_pictures2 = [sp5, sp6, sp7, sp8]
super_pictures3 = [sp9, sp10, sp11, sp12]



super_acco_somya = Accommodation.new(
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
  super_acco_somya.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
super_acco_somya.save!
puts "..."

super_acco_romain = Accommodation.new(
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
  super_acco_romain.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
super_acco_romain.save!
puts "..."

super_acco_amar = Accommodation.new(
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
  super_acco_amar.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
super_acco_amar.save!
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
  accommodation_id: super_acco_somya.id,
  exchange_id: e1.id,
  duration: 10,
  check_in: Date.parse("2023-01-10"),
  check_out: Date.parse("2023-01-20"),
  keys: "Office",
  petsitting: 1,
  transportation: "Car",
  others: "other modality parameter",
)
m1_e1.save!
puts "..."

m2_e1 = Modality.new(
  accommodation_id: super_acco_romain.id,
  exchange_id: e1.id,
  duration: 10,
  check_in: Date.parse("2023-01-10"),
  check_out: Date.parse("2023-01-20"),
  keys: "Handover",
  petsitting: 1,
  transportation: "Bike",
  others: "other modality parameter",
)
m2_e1.save!
puts "..."

m1_e2 = Modality.new(
  accommodation_id: super_acco_somya.id,
  exchange_id: e2.id,
  duration: 15,
  check_in: Date.parse("2022-07-15"),
  check_out: Date.parse("2023-07-30"),
  keys: "Office",
  petsitting: 0,
  transportation: "Car",
  others: "other modality parameter",
)
m1_e2.save!
puts "..."

m2_e2 = Modality.new(
  accommodation_id: super_acco_amar.id,
  exchange_id: e2.id,
  duration: 15,
  check_in: Date.parse("2022-07-15"),
  check_out: Date.parse("2023-07-30"),
  keys: "Handover",
  petsitting: 1,
  transportation: "Bike",
  others: "other modality parameter",
)
m2_e2.save!
puts "..."

m1_e3 = Modality.new(
  accommodation_id: super_acco_romain.id,
  exchange_id: e3.id,
  duration: 18,
  check_in: Date.parse("2023-08-12"),
  check_out: Date.parse("2023-08-30"),
  keys: "Office",
  petsitting: 0,
  transportation: "Car",
  others: "other modality parameter",
)
m1_e3.save!
puts "..."

m2_e3 = Modality.new(
  accommodation_id: super_acco_amar.id,
  exchange_id: e3.id,
  duration: 18,
  check_in: Date.parse("2023-08-12"),
  check_out: Date.parse("2023-08-30"),
  keys: "Handover",
  petsitting: 0,
  transportation: "Bike",
  others: "other modality parameter",
)
m2_e3.save!
puts "..."

puts "6 modalities created !"

############################################### REVIEWS #################################################################

puts "creating 6 reviews, 2 for each exchange ..."

r1 = Review.new(
  user_id: romain.id,
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
  user_id: amar.id,
  content: "Best way to visit the region and by far ! It was our first home exchange... and certainly not the last",
  modality_id: m1_e2.id
)
r3.save!
puts "..."

r4 = Review.new(
  user_id: somya.id,
  content: "Nothing to say, everything was incredible, thanks again for all your advices",
  modality_id: m2_e2.id
)
r4.save!
puts "..."

r5 = Review.new(
  user_id: amar.id,
  content: "I absolutely loved the house and my stay overall. Romain was super nice and really made the city special for my wife and I",
  modality_id: m1_e3.id
)
r5.save!
puts "..."

r6 = Review.new(
  user_id: romain.id,
  content: "Thank you !!! What a lovely home you have. Having a car to go around with easy parking was a blast I must say",
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
puts "Seeding done ! "
