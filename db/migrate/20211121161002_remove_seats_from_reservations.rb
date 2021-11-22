class RemoveSeatsFromReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :seats, :string
  end
end
