
Tag.destroy_all
# SocialGroup.destroy_all
tag = ["Prefiero no decirlo", "Amenaza", "Acoso verbal", "Acoso físico", "Violación", "Homofobia", "Racismo", "Atentado en contral el pudor", "Exploración sexual", "Misoginia", "Transfobia", "Violencia doméstica", "Xenofobia", "Otros"]
image = ["prefiero-no-decirlo.png", "amenaza.png", "acoso-verbal.png", "acoso-fisico.png", "violacion.png", "homofobia.png", "racismo.png", "atentado-en-control-el-pudor.png","exploracion-sexual.png", "misoginia.png", "transfobia.png", "violencia-domestica.png", "xenofobia.png", "otros.png"]
tag.each do |tag|
    Tag.create(
        title: tag
    )
end 

User.destroy_all
50.times do |i|
    User.create(
    name: "Joao#{i+1}",
    email: "joaodasneves#{i+1}@gmail.com",
    password: "123456",
    genre: ["Masculino", "Femenino", "Otro"].sample,
    birthdate: Faker::Date.birthday(18, 65),
    username: "Seraphiz#{i+1}"
    )
end

Post.destroy_all
tags = Tag.ids
users = User.ids
periodo = ["Prefiro no decirlo", "Mañana", "Tarde", "Noche", "Madrugada"]
contenido = ["Estaba por la calle, cuando unos tipos de la contru gritaton palabras de bajo nivel hacia mi, queria contestarles, pero no tenia coraje, yo era solamente una y ellos eran muchos", "Caminando por la calle, un tipo me pego con una lampada en la cabeza y me grito que los homosexuales no deberian existir", "Estaba trabajando en el supermercado X cuando un cliente al percibir que yo soy extrangero, me trato mal y dijo que me devolviera a mi país.", "Estaba caminando por la calle y percibia que dos tipos me estaban siguiendo, no habia nadie en la calle a esa hora, tuve miedo, pense que algo mas grabe iba pasar, logra tomar un taxi que justo estaba pasando en el camino y me fui a mi casa.", "Con mi pareja, estabamos caminando de las manos, e unos tipos nos amenazaron con cuchillos, congelamos en el momento sin saber como reaccionar, no se como aun estamos vivas.", "Saliendo de la tienda X, el guardia me paro para averiguar si yo no me robava nada del supermercado, vivo a 2 cuadras del supermercado y voy casi todos los dias, el guardia era nuevo esta mas que claro que lo hizo por mi color de piel", "No pude defenderme, eran 2 y yo solo una, estaban por hacer el peor cuando llego auxilio."]

1000.times do 
    Post.create(
        tag_id: tags.sample,
        user_id: users.sample,
        date: Faker::Date.between(2.years.ago, Date.today),
        age: rand(1..64),
        period_of_day: periodo.sample,
        address: "Avenida Providencia, #{rand(200..2300)}, Providencia",
        name: Faker::Name.name,
        content: contenido.sample,
        anonymous: [true, false].sample,
        active: [true, false].sample

    )
end 

Comment.destroy_all
contenido = ["Me paso lo mismo", "Cuidado por este secto, es peligroso a esta hora", "Te entiendo, tambien me da rabia","Que lata que la sociedad siga asi", "Juntos somos mas fuertes"]
1000.times do
    Comment.create(
        post_id: Post.ids.sample,
        user_id: User.ids.sample,
        content: contenido.sample,
        anonymous: [0, 1].sample
    )
end 
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?