class Hour < ApplicationRecord
  belongs_to :room
  has_many :seats
end
