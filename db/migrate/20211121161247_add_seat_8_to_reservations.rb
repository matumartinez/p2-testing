class AddSeat8ToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :seat_8, :integer
  end
end
