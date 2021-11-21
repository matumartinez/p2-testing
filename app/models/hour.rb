class Hour < ApplicationRecord
  belongs_to :room
  has_many :seats
  belongs_to :movie
  has_many :reservations
end
