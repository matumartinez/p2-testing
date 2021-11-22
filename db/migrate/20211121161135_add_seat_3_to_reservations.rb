class AddSeat3ToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :seat_3, :integer
  end
end
