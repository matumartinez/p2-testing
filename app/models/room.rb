class Room < ApplicationRecord
  has_many :hours
  has_many :seats
  has_many :reservations
end
