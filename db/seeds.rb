# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Tag.destroy_all
SocialGroup.destroy_all
# tag = ["Prefiero no decirlo", "Amenaza", "Acoso verbal", "Acoso físico", "Estupro", "Homofobia", "Racismo", "Atentado en contral el pudor", "Exploración sexual", "Stalking", "Transfobia", "Violencia doméstica", "Xenofobia" "Otros"]

# tag.each do |tag|
#     Tag.create(
#         title: tag
#     )
# end 

social_group = ["Homosexuales", "Bisexuales", "Transexuales", "Extrangeros", "Indígenas", "Negros", "Personas en situacion de discapacidad", "Mujeres"]

social_group.each do |asignacion|
    SocialGroup.create(
        name: asignacion
    )
end 
