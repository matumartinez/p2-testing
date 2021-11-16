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

# CREACIÓN DE SALAS Y HORARIOS POR SALA

room1 = Room.create(name: 'Room 1', id: 1)
room1.hours.create(hourinterval: 'Matiné 17:00 - 19:00', id: 1)
room1.hours.create(hourinterval: 'Tarde 19:00 - 21:00', id: 2)
room1.hours.create(hourinterval: 'Noche 21:00 - 23:00', id: 3)
room2 = Room.create(name: 'Room 2', id: 2)
room2.hours.create(hourinterval: 'Matiné 17:00 - 19:00', id: 4)
room2.hours.create(hourinterval: 'Tarde 19:00 - 21:00', id: 5)
room2.hours.create(hourinterval: 'Noche 21:00 - 23:00', id: 6)
room3 = Room.create(name: 'Room 3', id: 3)
room3.hours.create(hourinterval: 'Matiné 17:00 - 19:00', id: 7)
room3.hours.create(hourinterval: 'Tarde 19:00 - 21:00', id: 8)
room3.hours.create(hourinterval: 'Noche 21:00 - 23:00', id: 9)
room4 = Room.create(name: 'Room 4', id: 4)
room4.hours.create(hourinterval: 'Matiné 17:00 - 19:00', id: 10)
room4.hours.create(hourinterval: 'Tarde 19:00 - 21:00', id: 11)
room4.hours.create(hourinterval: 'Noche 21:00 - 23:00', id: 12)
room5 = Room.create(name: 'Room 5', id: 5)
room5.hours.create(hourinterval: 'Matiné 17:00 - 19:00', id: 13)
room5.hours.create(hourinterval: 'Tarde 19:00 - 21:00', id: 14)
room5.hours.create(hourinterval: 'Noche 21:00 - 23:00', id: 15)
room6 = Room.create(name: 'Room 6', id: 6)
room6.hours.create(hourinterval: 'Matiné 17:00 - 19:00', id: 16)
room6.hours.create(hourinterval: 'Tarde 19:00 - 21:00', id: 17)
room6.hours.create(hourinterval: 'Noche 21:00 - 23:00', id: 18)
room7 = Room.create(name: 'Room 7', id: 7)
room7.hours.create(hourinterval: 'Matiné 17:00 - 19:00', id: 19)
room7.hours.create(hourinterval: 'Tarde 19:00 - 21:00', id: 20)
room7.hours.create(hourinterval: 'Noche 21:00 - 23:00', id: 21)
room8 = Room.create(name: 'Room 8', id: 8)
room8.hours.create(hourinterval: 'Matiné 17:00 - 19:00', id: 22)
room8.hours.create(hourinterval: 'Tarde 19:00 - 21:00', id: 23)
room8.hours.create(hourinterval: 'Noche 21:00 - 23:00', id: 24)

#Creación de asientos por sala
48.times do |i|
    hour = Hour.find_by(id: 1)
    hour.seats.create(number: i.to_s, room_id: 1, occupied: "NO")

    hour = Hour.find_by(id: 2)
    hour.seats.create(number: i.to_s, room_id: 1, occupied: "NO")

    hour = Hour.find_by(id: 3)
    hour.seats.create(number: i.to_s, room_id: 1, occupied: "NO")
end

48.times do |i|
    hour = Hour.find_by(id: 4)
    hour.seats.create(number: i.to_s, room_id: 2, occupied: "NO")

    hour = Hour.find_by(id: 5)
    hour.seats.create(number: i.to_s, room_id: 2, occupied: "NO")

    hour = Hour.find_by(id: 6)
    hour.seats.create(number: i.to_s, room_id: 2, occupied: "NO")
end

48.times do |i|
    hour = Hour.find_by(id: 7)
    hour.seats.create(number: i.to_s, room_id: 3, occupied: "NO")

    hour = Hour.find_by(id: 8)
    hour.seats.create(number: i.to_s, room_id: 3, occupied: "NO")

    hour = Hour.find_by(id: 9)
    hour.seats.create(number: i.to_s, room_id: 3, occupied: "NO")
end

48.times do |i|
    hour = Hour.find_by(id: 10)
    hour.seats.create(number: i.to_s, room_id: 4, occupied: "NO")

    hour = Hour.find_by(id: 11)
    hour.seats.create(number: i.to_s, room_id: 4, occupied: "NO")

    hour = Hour.find_by(id: 12)
    hour.seats.create(number: i.to_s, room_id: 4, occupied: "NO")
end

48.times do |i|
    hour = Hour.find_by(id: 13)
    hour.seats.create(number: i.to_s, room_id: 5, occupied: "NO")

    hour = Hour.find_by(id: 14)
    hour.seats.create(number: i.to_s, room_id: 5, occupied: "NO")

    hour = Hour.find_by(id: 15)
    hour.seats.create(number: i.to_s, room_id: 5, occupied: "NO")
end

48.times do |i|
    hour = Hour.find_by(id: 16)
    hour.seats.create(number: i.to_s, room_id: 6, occupied: "NO")

    hour = Hour.find_by(id: 17)
    hour.seats.create(number: i.to_s, room_id: 6, occupied: "NO")

    hour = Hour.find_by(id: 18)
    hour.seats.create(number: i.to_s, room_id: 6, occupied: "NO")
end

48.times do |i|
    hour = Hour.find_by(id: 19)
    hour.seats.create(number: i.to_s, room_id: 7, occupied: "NO")

    hour = Hour.find_by(id: 20)
    hour.seats.create(number: i.to_s, room_id: 7, occupied: "NO")

    hour = Hour.find_by(id: 21)
    hour.seats.create(number: i.to_s, room_id: 7, occupied: "NO")
end

48.times do |i|
    hour = Hour.find_by(id: 22)
    hour.seats.create(number: i.to_s, room_id: 8, occupied: "NO")

    hour = Hour.find_by(id: 23)
    hour.seats.create(number: i.to_s, room_id: 8, occupied: "NO")

    hour = Hour.find_by(id: 24)
    hour.seats.create(number: i.to_s, room_id: 8, occupied: "NO")
end