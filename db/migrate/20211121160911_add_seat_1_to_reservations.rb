class AddSeat1ToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :seat_1, :integer
  end
end
