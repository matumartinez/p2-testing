class AddSeat5ToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :seat_5, :integer
  end
end
