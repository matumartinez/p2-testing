class AddSeat10ToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :seat_10, :integer
  end
end
