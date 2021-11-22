class AddSeat6ToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :seat_6, :integer
  end
end
