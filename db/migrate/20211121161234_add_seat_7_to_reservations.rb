class AddSeat7ToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :seat_7, :integer
  end
end
