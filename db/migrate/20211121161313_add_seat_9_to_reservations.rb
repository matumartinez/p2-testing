class AddSeat9ToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :seat_9, :integer
  end
end
