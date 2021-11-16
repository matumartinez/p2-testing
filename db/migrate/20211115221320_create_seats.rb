class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.string :number
      t.integer :room_id
      t.integer :hour_id
      t.string :occupied

      t.timestamps
    end
  end
end
