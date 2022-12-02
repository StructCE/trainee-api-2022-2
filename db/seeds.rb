5.times do |i|
    Genre.create!(name: "Genre#{i+1}")
end

# 10.times do |i|
#     User.create!(name: "User#{i+1}", is_admin: false)
# end
User.create!(name: "Lucas", is_admin: true)

10.times do |i|
    Movie.create!(name: "Movie#{i+1}", genre_id: rand(1..5))
end

10.times do |i|
    Rating.create!(grade: rand(0..1), comment: "Comment#{i+1}", user_id: 1, movie_id: i+1)
end

User.find_by(name: "Lucas").profile_picture.attach(io: File.open('./public/depositphotos_51926417-stock-photo-hands-holding-the-sun-at.jpg'), filename:'depositphotos_51926417-stock-photo-hands-holding-the-sun-at.jpg')


Movie.first.images.attach(io: File.open('./public/prof.jpeg'), filename:'prof.jpeg')
Movie.first.images.attach(io: File.open('./public/mat.webp'), filename:'mat.webp')



Admin.create!(email:"trainee@struct", password:"123456")
