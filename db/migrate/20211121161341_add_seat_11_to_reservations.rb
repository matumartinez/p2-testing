class AddSeat11ToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :seat_11, :integer
  end
end
