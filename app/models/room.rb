class Room < ApplicationRecord
  has_many :hours
  has_many :seats
end
