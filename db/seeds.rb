require 'faker'

# Active le français pour Faker
Faker::Config.locale = 'fr'

# Nettoyage total
Comment.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

# 1. Création des villes françaises
10.times do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

# 2. Création des utilisateurs
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: 10),
    email: Faker::Internet.unique.email,
    age: rand(18..80),
    password: "password123",
    city: City.all.sample # Sélectionne une ville au hasard
  )
end

# 3. Création des potins
20.times do
  Gossip.create!(
    title: Faker::Lorem.sentence(word_count: 3).first(14), # Limite à 14 caractères pour la validation
    content: Faker::Lorem.paragraph(sentence_count: 2),
    user: User.all.sample
  )
end

# 4. Création des commentaires
50.times do
  Comment.create!(
    content: Faker::Lorem.sentence(word_count: 8),
    user: User.all.sample,
    gossip: Gossip.all.sample
  )
end