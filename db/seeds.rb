
# Tag.destroy_all
# # SocialGroup.destroy_all
# tag = ["Prefiero no decirlo", "Amenaza", "Acoso verbal", "Acoso físico", "Estupro", "Homofobia", "Racismo", "Atentado en contral el pudor", "Exploración sexual", "Stalking", "Transfobia", "Violencia doméstica", "Xenofobia", "Otros"]

# tag.each do |tag|
#     Tag.create(
#         title: tag
#     )
# end 

# social_group = ["Homosexuales", "Bisexuales", "Transexuales", "Extrangeros", "Indígenas", "Negros", "Personas en situacion de discapacidad", "Mujeres"]

# social_group.each do |asignacion|
#     SocialGroup.create(
#         name: asignacion
#     )
# end 

# User.destroy_all
# 20.times do |i|
#     User.create(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: "123456",
#     genre: ["Masculino", "Femenino", "Otro"].sample,
#     birthdate: Faker::Date.birthday(18, 65),
#     username: "Joao das Neves #{i+1}"
#     )
# end

Post.destroy_all
tags = Tag.ids
users = User.ids
periodo = ["Prefiro no decirlo", "Mañana", "Tarde", "Noche", "Madrugada"]

50.times do 
    Post.create(
        tag_id: tags.sample,
        user_id: users.sample,
        date: Faker::Date.between(2.years.ago, Date.today),
        age: rand(1..64),
        period_of_day: periodo.sample,
        address: Faker::Address.street_name,
        name: Faker::Name.name,
        content: "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquam odio mollitia tempora.",
        anonymous: [true, false].sample

    )
end 
