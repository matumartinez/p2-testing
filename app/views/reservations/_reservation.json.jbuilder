json.extract! reservation, :id, :seats, :row, :hour_id, :movie_id, :room_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
