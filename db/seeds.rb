require 'faker'

# On vide la base avant de remplir pour éviter les doublons
City.destroy_all
User.destroy_all
Gossip.destroy_all

# Création de 10 villes
10.times { City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code) }

# Création de 10 utilisateurs
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: rand(18..80),
    city: City.all.sample
  )
end

# Création de 20 potins liés aux utilisateurs
20.times do
  Gossip.create!(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(sentence_count: 5),
    user: User.all.sample
  )
end

puts "Seed terminé : Base prête à l'emploi !"