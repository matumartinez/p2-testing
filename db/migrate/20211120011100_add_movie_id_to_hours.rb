class AddMovieIdToHours < ActiveRecord::Migration[5.2]
  def change
    add_column :hours, :movie_id, :integer
  end
end
