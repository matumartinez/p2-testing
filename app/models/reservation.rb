class Reservation < ApplicationRecord
    belongs_to :room
    belongs_to :hour
    belongs_to :movie
end
