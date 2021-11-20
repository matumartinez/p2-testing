class Movie < ApplicationRecord
    has_many :rooms
    has_many :hours
end
