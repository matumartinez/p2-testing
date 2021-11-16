class CreateShowRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :show_rooms do |t|

      t.timestamps
    end
  end
end
