100.times do |i|
    Genre.create!(name: "Genre#{i}")
end


Admin.create!(email:"trainee@struct", password:"123456")