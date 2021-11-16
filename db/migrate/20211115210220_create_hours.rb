class CreateHours < ActiveRecord::Migration[5.2]
  def change
    create_table :hours do |t|
      t.string :hourinterval
      t.integer :room_id

      t.timestamps
    end
  end
end
