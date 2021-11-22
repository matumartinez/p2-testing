class AddSeat12ToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :seat_12, :integer
  end
end
