# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Ver el schema para saber que campos tienen los post, creamos primero el usuario porque los post dependen de este
#Hay que empezar el seed destruyendo los datos

Post.destroy_all
User.destroy_all

10.times do |i|
  u = User.create!(name: "User #{i}", email: "Email#{i}@gmail.com", password: "123456")
  p = Post.create!(title: "Post #{i}", content: "Contenido #{i}", user: u)
  10.times do |j|
    c = p.comments.build(content: "comentario #{j} del post #{i}", user: u, post: p)
    #importante guardar los comentarios para que se vean
    c.save
  end
end
