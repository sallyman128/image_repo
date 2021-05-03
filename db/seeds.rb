# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ title: 'Star Wars' }, { title: 'Lord of the Rings' }])
#   Character.create(title: 'Luke', movie: movies.first)

user1 = User.create(username: "Riku", password: "rikupass")
user2 = User.create(username: "Sora", password: "sorapass")



image1 = user1.images.build()
image2 = user1.images.build()
image3 = user1.images.build()
image4 = user2.images.build()


image1.picture.attach(io: File.open("app/assets/images/african-elephant-close-up.jpg"), filename: "african-elephant-close-up.jpg")
image1.save
image2.picture.attach(io: File.open("app/assets/images/elephant-peek-a-boo.jpg"), filename: "elephant-peek-a-boo.jpg")
image2.save
image3.picture.attach(io: File.open("app/assets/images/elephant-snacks-on-bamboo.jpg"), filename: "elephant-snacks-on-bamboo.jpg")
image3.save
image4.picture.attach(io: File.open("app/assets/images/elephant-with-amber-eyes.jpg"), filename: "elephant'-with-amber-eyes.jpg")
image4.save