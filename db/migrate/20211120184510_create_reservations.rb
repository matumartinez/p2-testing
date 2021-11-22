class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :seats
      t.string :row
      t.integer :hour_id
      t.integer :movie_id
      t.integer :room_id

      t.timestamps
    end
  end
end
