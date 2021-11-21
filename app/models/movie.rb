class Movie < ApplicationRecord
    has_many :rooms
    has_many :hours
    has_many :movies
    has_many :reservations
end
