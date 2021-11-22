class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new

    @hours = Hour.all
    if @hours.length() == 24
      redirect_back(fallback_location: root_path, notice: "There are no hours available to add a movie.")
      return
    end

    @available_hour = []

    @rooms = Room.all
    @rooms.each do |room|
      @hours = room.hours
      next if @hours.length() == 3

      unavailable_hour = []
      hours_string = ['Matinee 17:00 - 19:00', 'Afternoon 19:00 - 21:00', 'Night 21:00 - 23:00']

      @hours.each do |hour|
          if hour.hourinterval
            unavailable_hour.push(hour.hourinterval)
          end
      end

      hours_string.each do |str|
        unless unavailable_hour.include? str
          final_str = "room #{room.id}/" + str
          @available_hour.push(final_str)
        end
      end
    end
    @available_hour

  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)
    new_id = Movie.last.id + 1
    @movie.id = new_id

    @schedule = params.require(:movie).permit(:schedule)["schedule"].split("/")
    room_id = @schedule[0].split(" ")[1]
    @room = Room.find_by(id: room_id)
    hour_id = Hour.last.id + 1



    respond_to do |format|
      if @movie.save
        @hour = @room.hours.create(hourinterval: @schedule[1], id: hour_id, movie_id: @movie.id)

        4.times do |j|
          12.times do |i|
              hour = Hour.find_by(id: @hour.id)
              hour.seats.create(number: (i+1).to_s, room_id: @room.id, occupied: "NO")
          end
        end

        redirect_back(fallback_location: root_path, notice: "Movie created successfully.")
        return
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :image)
    end
end
