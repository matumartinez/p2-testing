class AddSeat2ToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :seat_2, :integer
  end
end
