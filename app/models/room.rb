class Room < ApplicationRecord
  has_many :hours
  has_many :seats
  has_many :reservations
  has_many :movies
end
