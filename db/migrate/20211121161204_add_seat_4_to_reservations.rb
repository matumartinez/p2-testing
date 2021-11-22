class AddSeat4ToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :seat_4, :integer
  end
end
