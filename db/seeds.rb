# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Room.destroy_all
Hour.destroy_all
Seat.destroy_all
Movie.destroy_all
Reservation.destroy_all


# CREACIÓN DE PELÍCULAS

movie1 = Movie.create(title: 'Toy Story 4', image: 'https://lumiere-a.akamaihd.net/v1/images/image_bf8739ba.jpeg?region=0,0,540,810', id:1)
movie2 = Movie.create(title: 'The Hangover', image: 'https://m.media-amazon.com/images/I/418lnoit6yL._SY445_.jpg', id:2)
movie3 = Movie.create(title: 'Titanic', image: 'https://es.web.img3.acsta.net/medias/nmedia/18/86/91/41/19870073.jpg', id:3)
movie4 = Movie.create(title: 'Shrek', image: 'https://m.media-amazon.com/images/I/51p9ApRmjOL.jpg', id:4)
movie5 = Movie.create(title: 'Pride and Prejudice', image: 'https://aquileana.files.wordpress.com/2013/09/pride_prejudice-movie-poster.jpg?w=584&h=865', id:5)
movie6 = Movie.create(title: "Harry Potter and the Sorcerer's Stone", image: 'https://images.moviesanywhere.com/143cdb987186a1c8f94d4f18de211216/fdea56fa-2703-47c1-8da8-70fc5382e1ea.jpg', id:6)
movie7 = Movie.create(title: 'Narnia', image: 'https://pictures.abebooks.com/isbn/9780060765484-us.jpg', id: 7)
movie8 = Movie.create(title: 'The Orphanage', image: 'https://play-lh.googleusercontent.com/sMV_LJBtlw82ucCSHV65eGyND9A8rSG93Jr4PE72VmHb_DFyLkpfkzBjm3_FLqdc88To', id:8)
movie9 = Movie.create(title: 'Avatar 2', image: 'https://es.web.img3.acsta.net/pictures/20/06/17/11/47/3296884.jpg', id:9)

# CREACIÓN DE SALAS Y HORARIOS POR SALA

room1 = Room.create(name: 'Room 1', id: 1)
room1.hours.create(hourinterval: 'Matinee 17:00 - 19:00', id: 1, movie_id: 1)
room1.hours.create(hourinterval: 'Afternoon 19:00 - 21:00', id: 2, movie_id: 2)
room1.hours.create(hourinterval: 'Night 21:00 - 23:00', id: 3, movie_id: 3)
room2 = Room.create(name: 'Room 2', id: 2)
room2.hours.create(hourinterval: 'Matinee 17:00 - 19:00', id: 4, movie_id: 1)
room2.hours.create(hourinterval: 'Afternoon 19:00 - 21:00', id: 5, movie_id: 4)
room2.hours.create(hourinterval: 'Night 21:00 - 23:00', id: 6, movie_id: 3)
room3 = Room.create(name: 'Room 3', id: 3)
room3.hours.create(hourinterval: 'Matinee 17:00 - 19:00', id: 7, movie_id: 4)
room3.hours.create(hourinterval: 'Afternoon 19:00 - 21:00', id: 8, movie_id: 6)
room3.hours.create(hourinterval: 'Night 21:00 - 23:00', id: 9, movie_id: 8)
room4 = Room.create(name: 'Room 4', id: 4)
room4.hours.create(hourinterval: 'Matinee 17:00 - 19:00', id: 10, movie_id: 7)
room4.hours.create(hourinterval: 'Afternoon 19:00 - 21:00', id: 11, movie_id: 9)
room4.hours.create(hourinterval: 'Night 21:00 - 23:00', id: 12, movie_id: 8)
room5 = Room.create(name: 'Room 5', id: 5)
room5.hours.create(hourinterval: 'Matinee 17:00 - 19:00', id: 13, movie_id: 6)
room5.hours.create(hourinterval: 'Afternoon 19:00 - 21:00', id: 14, movie_id: 2)
room5.hours.create(hourinterval: 'Night 21:00 - 23:00', id: 15, movie_id: 5)
room6 = Room.create(name: 'Room 6', id: 6)
room6.hours.create(hourinterval: 'Matinee 17:00 - 19:00', id: 16, movie_id: 1)
room6.hours.create(hourinterval: 'Afternoon 19:00 - 21:00', id: 17, movie_id: 2)
# room6.hours.create(hourinterval: 'Night 21:00 - 23:00', id: 18, movie_id: 9)
room7 = Room.create(name: 'Room 7', id: 7)
room7.hours.create(hourinterval: 'Matinee 17:00 - 19:00', id: 19, movie_id: 7)
# room7.hours.create(hourinterval: 'Afternoon 19:00 - 21:00', id: 20, movie_id: 5)
# room7.hours.create(hourinterval: 'Night 21:00 - 23:00', id: 21, movie_id: 8)
room8 = Room.create(name: 'Room 8', id: 8)
# room8.hours.create(hourinterval: 'Matinee 17:00 - 19:00', id: 22, movie_id: 7)

#Creación de asientos por sala
4.times do |j|
    12.times do |i|
        hour = Hour.find_by(id: 1)
        hour.seats.create(number: (i+1).to_s, room_id: 1, occupied: "NO")

        hour = Hour.find_by(id: 2)
        hour.seats.create(number: (i+1).to_s, room_id: 1, occupied: "NO")

        hour = Hour.find_by(id: 3)
        hour.seats.create(number: (i+1).to_s, room_id: 1, occupied: "NO")
    end
end

4.times do |j|
    12.times do |i|
        hour = Hour.find_by(id: 4)
        hour.seats.create(number: (i+1).to_s, room_id: 2, occupied: "NO")

        hour = Hour.find_by(id: 5)
        hour.seats.create(number: (i+1).to_s, room_id: 2, occupied: "NO")

        hour = Hour.find_by(id: 6)
        hour.seats.create(number: (i+1).to_s, room_id: 2, occupied: "NO")
    end
end

4.times do |j|
    12.times do |i|
        hour = Hour.find_by(id: 7)
        hour.seats.create(number: (i+1).to_s, room_id: 3, occupied: "NO")

        hour = Hour.find_by(id: 8)
        hour.seats.create(number: (i+1).to_s, room_id: 3, occupied: "NO")

        hour = Hour.find_by(id: 9)
        hour.seats.create(number: (i+1).to_s, room_id: 3, occupied: "NO")
    end
end

4.times do |j|
    12.times do |i|
        hour = Hour.find_by(id: 10)
        hour.seats.create(number: (i+1).to_s, room_id: 4, occupied: "NO")

        hour = Hour.find_by(id: 11)
        hour.seats.create(number: (i+1).to_s, room_id: 4, occupied: "NO")

        hour = Hour.find_by(id: 12)
        hour.seats.create(number: (i+1).to_s, room_id: 4, occupied: "NO")
    end
end

4.times do |j|
    12.times do |i|
        hour = Hour.find_by(id: 13)
        hour.seats.create(number: (i+1).to_s, room_id: 5, occupied: "NO")

        hour = Hour.find_by(id: 14)
        hour.seats.create(number: (i+1).to_s, room_id: 5, occupied: "NO")

        hour = Hour.find_by(id: 15)
        hour.seats.create(number: (i+1).to_s, room_id: 5, occupied: "NO")
    end
end

4.times do |j|
    12.times do |i|
        hour = Hour.find_by(id: 16)
        hour.seats.create(number: (i+1).to_s, room_id: 6, occupied: "NO")

        hour = Hour.find_by(id: 17)
        hour.seats.create(number: (i+1).to_s, room_id: 6, occupied: "NO")

        # hour = Hour.find_by(id: 18)
        # hour.seats.create(number: (i+1).to_s, room_id: 6, occupied: "NO")
    end
end

4.times do |j|
    12.times do |i|
        hour = Hour.find_by(id: 19)
        hour.seats.create(number: (i+1).to_s, room_id: 7, occupied: "NO")

        # hour = Hour.find_by(id: 20)
        # hour.seats.create(number: (i+1).to_s, room_id: 7, occupied: "NO")

        # hour = Hour.find_by(id: 21)
        # hour.seats.create(number: (i+1).to_s, room_id: 7, occupied: "NO")
    end
end

# 4.times do |j|
#     12.times do |i|
#         hour = Hour.find_by(id: 22)
#         hour.seats.create(number: (i+1).to_s, room_id: 8, occupied: "NO")

        
#     end
# end