class Seat < ApplicationRecord
  belongs_to :room
  belongs_to :hour
  belongs_to :reservation
end
